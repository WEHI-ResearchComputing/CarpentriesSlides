function Pandoc(doc)
    local slides = pandoc.List({
        -- We add each of the episode titles as a title slide
        pandoc.Header(1, doc.meta.title),
    })

    -- Add the questions and objectives to the title slide
    doc:walk({
        Div = function(div)
            if div.classes:includes("questions") then
                div.classes = {"overview"}
                div.content:insert(1, pandoc.Header(2, "Questions"))
                table.insert(slides, div)
                return div
            elseif div.classes:includes("objectives") then
                div.classes = {"overview"}
                div.content:insert(1, pandoc.Header(2, "Objectives"))
                table.insert(slides, div)
                return div
            end
        end
    })

    -- Close the title slide
    table.insert(slides, pandoc.HorizontalRule())

    -- Only keep certain elements: figures and challenges
    doc:walk({
        Image = function(image)
            table.insert(slides, image)
            table.insert(slides, pandoc.HorizontalRule())
        end,
        Div = function(div)
            if div.classes:includes("challenge") then
                -- Find the solution block, and remove it from inside the challenge
                -- since we want them on separate slides
                solution = nil
                challenge = div:walk({
                    Div = function(subdiv) 
                        if subdiv.classes:includes("solution") then
                            solution = subdiv
                            return {}
                        else
                            return subdiv
                        end
                    end
                })
                table.insert(slides, challenge)
                table.insert(slides, pandoc.HorizontalRule())

                -- if solution ~= nil then
                --     table.insert(slides, solution)
                --     table.insert(slides, pandoc.HorizontalRule())
                -- end
            elseif div.classes:includes("discussion") then
                -- Include discussions
                table.insert(slides, div)
                table.insert(slides, pandoc.HorizontalRule())
            end
        end
    })

    return pandoc.Pandoc(slides)
end
