module ISX.Factory (
    fRock
    ) where


import              Network.URI
import              PVK.Com.API.Ext.URI
import qualified    Data.Map.Strict                         as  Map
import qualified    Data.Text                               as  T
import qualified    PVK.Com.API.Resource.ISXPick            as  R


fRock :: Text -> IO R.Rock
fRock url = do
    body <- readFileBS $ fixturePage url
    return $ R.Rock {
        R.rockMeta   = meta,
        R.rockHeader = Map.empty,
        R.rockBody   = body}
    where
        Just metaUrl = parseUrl url
        meta = R.RockMeta {
            R.rockMetaUrl        = metaUrl,
            R.rockMetaStatusCode = Just "200"}


fixturePage :: Text -> FilePath
fixturePage url = toString $ "test/fixture/pages/" <> f
    where
        f = if T.takeEnd 1 url == "/"
            then url <> "index.html"
            else url

parseUrl :: Text -> Maybe URIAbsolute
parseUrl url = URIAbsolute <$> parseAbsoluteURI (toString $ "http://" <> url)