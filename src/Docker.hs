module Docker where

import           RIO

import qualified Network.HTTP.Simple as HTTP

newtype Image = Image Text
  deriving (Eq, Show)

newtype ContainerExitCode = ContainerExitCode Int
  deriving (Eq, Show)

exitCodeToInt :: ContainerExitCode -> Int
exitCodeToInt (ContainerExitCode code) = code

imageToText :: Image -> Text
imageToText (Image image) = image

data CreateContainerOptions
  = CreateContainerOptions
    { image :: Image
    }

createContainer :: CreateContainerOptions -> IO ()
createContainer options = do
  let body = () -- TODO figure out actual request body
  let req = HTTP.defaultRequest
            & HTTP.setRequestPath "/v1.40/containers/create"
            & HTTP.setRequestMethod "POST"
            & HTTP.setRequestBodyJSON body
  res <- HTTP.httpBS req
   -- Dump the response to stdout to check what we're getting back
  traceShowIO res

