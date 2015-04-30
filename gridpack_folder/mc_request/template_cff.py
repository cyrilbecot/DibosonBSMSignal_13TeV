import FWCore.ParameterSet.Config as cms

# link to cards:
# https://github.com/cms-sw/genproductions/tree/a3da365a6c89cdfa04e06d7a78067632a6499248/bin/MadGraph5_aMCatNLO/cards/production/13TeV/exo_diboson/Spin-SPIN/PROCESS/TYPE


externalLHEProducer = cms.EDProducer("ExternalLHEProducer",
    args = cms.vstring('LOCATION'),
    nEvents = cms.untracked.uint32(5000),
    numberOfParameters = cms.uint32(1),
    outputFile = cms.string('cmsgrid_final.lhe'),
    scriptName = cms.FileInPath('GeneratorInterface/LHEInterface/data/run_generic_tarball_cvmfs.sh')
)
