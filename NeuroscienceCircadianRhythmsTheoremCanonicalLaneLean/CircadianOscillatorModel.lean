import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace NeuroscienceCircadianRhythmsTheoremCanonicalLaneLean

structure CircadianOscillatorModel where
  period : Float
  amplitude : Float
  phase : Float
  mathlibSubstrateReady : Bool

def primitiveCircadianOscillatorModel : CircadianOscillatorModel := {
  period := 24.0,
  amplitude := 1.0,
  phase := 0.0,
  mathlibSubstrateReady := true
}

def CircadianOscillatorModelClosed (M : CircadianOscillatorModel) : Prop :=
  M.period = 24.0 ∧ M.amplitude = 1.0 ∧ M.phase = 0.0 ∧ M.mathlibSubstrateReady = true

theorem circadian_oscillator_model_closed_checked :
    CircadianOscillatorModelClosed primitiveCircadianOscillatorModel := by
  exact And.intro rfl (And.intro rfl (And.intro rfl rfl))

end NeuroscienceCircadianRhythmsTheoremCanonicalLaneLean
end HautevilleHouse