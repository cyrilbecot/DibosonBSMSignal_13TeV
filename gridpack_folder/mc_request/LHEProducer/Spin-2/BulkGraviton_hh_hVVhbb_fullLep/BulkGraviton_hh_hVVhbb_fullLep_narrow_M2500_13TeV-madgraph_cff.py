import FWCore.ParameterSet.Config as cms

# link to cards:
# https://github.com/cms-sw/genproductions/tree/31b6e7510443b74e0f9aac870e4eb9ae30c19d65/bin/MadGraph5_aMCatNLO/cards/production/13TeV/exo_diboson/Spin-2/BulkGraviton_hh_hVVhbb_fullLep/BulkGraviton_hh_hVVhbb_fullLep_narrow_M2500


externalLHEProducer = cms.EDProducer("ExternalLHEProducer",
    args = cms.vstring('/cvmfs/cms.cern.ch/phys_generator/gridpacks/slc6_amd64_gcc481/13TeV/madgraph/V5_2.2.2/exo_diboson/Spin-2/BulkGraviton_hh_hVVhbb_fullLep/narrow/v3/BulkGraviton_hh_hVVhbb_fullLep_narrow_M2500_tarball.tar.xz'),
    nEvents = cms.untracked.uint32(5000),
    numberOfParameters = cms.uint32(1),
    outputFile = cms.string('cmsgrid_final.lhe'),
    scriptName = cms.FileInPath('GeneratorInterface/LHEInterface/data/run_generic_tarball_cvmfs.sh')
)
