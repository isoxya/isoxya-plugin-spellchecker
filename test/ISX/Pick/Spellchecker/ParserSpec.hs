module ISX.Pick.Spellchecker.ParserSpec (spec) where


import              ISX.Pick.Spellchecker.Parser
import              ISX.Test
import              Prelude                                 hiding  (get)


spec :: Spec
spec = do
    describe "example.com" $
        it "apex" $
            testPage "example.com/"
    
    describe "www.pavouk.tech" $ do
        it "apex" $
            testPage "www.pavouk.tech/"
        
        it "robots" $
            testPage "www.pavouk.tech/robots.txt"
    
    describe "www.tiredpixel.com" $
        it "apex" $
            testPage "www.tiredpixel.com/"


testPage :: Text -> IO ()
testPage url = do
    rock <- fRock url
    let texts = parse rock
    assertTextsLookup texts url
