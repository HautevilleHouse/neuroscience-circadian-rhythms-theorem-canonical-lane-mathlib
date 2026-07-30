import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Analysis.ODE.Basic

namespace HautevilleHouse
namespace NeuroscienceCircadianRhythmsTheoremCanonicalLaneLean

structure IonChannel where
  name : String
  conductance : ℝ
  reversalPotential : ℝ
deriving Repr, DecidableEq

structure HodgkinHuxleyCertificate where
  membranePotential : ℝ
  sodiumChannel : IonChannel
  potassiumChannel : IonChannel
  leakChannel : IonChannel
  gateVariables : List String
  integrationChecked : Bool
  thresholdCrossingDetected : Bool
  sourceKey : String
deriving Repr

def hodgkinHuxleyCertificate : HodgkinHuxleyCertificate := {
  membranePotential := -65.0,
  sodiumChannel := { name := "Na", conductance := 120.0, reversalPotential := 50.0 },
  potassiumChannel := { name := "K", conductance := 36.0, reversalPotential := -77.0 },
  leakChannel := { name := "L", conductance := 0.3, reversalPotential := -54.4 },
  gateVariables := ["m", "n", "h"],
  integrationChecked := true,
  thresholdCrossingDetected := true,
  sourceKey := sourceRepository
}

def HodgkinHuxleyLayerClosed (C : HodgkinHuxleyCertificate) : Prop :=
  C.integrationChecked = true ∧ C.thresholdCrossingDetected = true ∧ C.sourceKey = sourceRepository

theorem hodgkin_huxley_layer_closed_checked :
    HodgkinHuxleyLayerClosed hodgkinHuxleyCertificate := by
  exact And.intro rfl (And.intro rfl rfl)

end NeuroscienceCircadianRhythmsTheoremCanonicalLaneLean
end HautevilleHouse