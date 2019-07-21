module ISX.Pick.Spellchecker.Zone.Common.ApexSpec (spec) where


import              ISX.Test
import              Prelude                                 hiding  (get)
import              System.Environment                      (getEnv)
import qualified    Data.Map                                as  M


spec :: Spec
spec =
    describe "/ GET" $
        it "ok" $ do
            version_ <- liftIO $ toText <$> getEnv "VERSION"
            res <- withSrv $ get "/" pR
            assertSuccess res
            b <- getResponseBody res
            toString (b ^. key "t_now" . _String) `shouldContain` "T"
            b ^. key "version" . _String `shouldBe` version_
            assertElemN res 2


pR :: Params
pR = M.empty
