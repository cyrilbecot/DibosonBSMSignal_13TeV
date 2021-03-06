import FWCore.ParameterSet.Config as cms

# link to cards:
# https://github.com/cms-sw/genproductions/tree/b9fddd83b7d8e490347744408902940547e8135f/bin/MadGraph5_aMCatNLO/cards/production/13TeV/exo_diboson/Spin-0/Radion_WW_WlepWhad/Radion_WW_WlepWhad_narrow_M1800


externalLHEProducer = cms.EDProducer("ExternalLHEProducer",
    args = cms.vstring('/cvmfs/cms.cern.ch/phys_generator/gridpacks/slc6_amd64_gcc481/13TeV/madgraph/V5_2.2.2/exo_diboson/Spin-0/Radion_WW_WlepWhad/narrow/v1/Radion_WW_WlepWhad_narrow_M1800_tarball.tar.xz'),
    nEvents = cms.untracked.uint32(5000),
    numberOfParameters = cms.uint32(1),
    outputFile = cms.string('cmsgrid_final.lhe'),
    scriptName = cms.FileInPath('GeneratorInterface/LHEInterface/data/run_generic_tarball_cvmfs.sh')
)
