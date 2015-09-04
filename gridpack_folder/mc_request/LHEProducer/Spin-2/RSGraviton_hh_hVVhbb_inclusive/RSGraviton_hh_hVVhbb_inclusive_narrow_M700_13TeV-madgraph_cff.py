import FWCore.ParameterSet.Config as cms

# link to cards:
# https://github.com/cms-sw/genproductions/tree/31b6e7510443b74e0f9aac870e4eb9ae30c19d65/bin/MadGraph5_aMCatNLO/cards/production/13TeV/exo_diboson/Spin-2/RSGraviton_hh_hVVhbb_inclusive/RSGraviton_hh_hVVhbb_inclusive_narrow_M700


externalLHEProducer = cms.EDProducer("ExternalLHEProducer",
    args = cms.vstring('/cvmfs/cms.cern.ch/phys_generator/gridpacks/slc6_amd64_gcc481/13TeV/madgraph/V5_2.2.2/exo_diboson/Spin-2/RSGraviton_hh_hVVhbb_inclusive/narrow/v1/RSGraviton_hh_hVVhbb_inclusive_narrow_M700_tarball.tar.xz'),
    nEvents = cms.untracked.uint32(5000),
    numberOfParameters = cms.uint32(1),
    outputFile = cms.string('cmsgrid_final.lhe'),
    scriptName = cms.FileInPath('GeneratorInterface/LHEInterface/data/run_generic_tarball_cvmfs.sh')
)
