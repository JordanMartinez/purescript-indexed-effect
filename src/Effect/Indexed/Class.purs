module Effect.Indexed.Class where

import Prelude

import Control.Monad.Indexed (class IxMonad)
import Data.Indexed (Indexed(..))
import Effect (Effect)
import Effect.Class (class MonadEffect, liftEffect)

class IxMonad m <= IxMonadEffect m where
  iliftEffect :: forall x a. Effect a -> m x x a

instance ixMonadEffectIndexed :: (MonadEffect m) => IxMonadEffect (Indexed m) where
  iliftEffect = Indexed <<< liftEffect
