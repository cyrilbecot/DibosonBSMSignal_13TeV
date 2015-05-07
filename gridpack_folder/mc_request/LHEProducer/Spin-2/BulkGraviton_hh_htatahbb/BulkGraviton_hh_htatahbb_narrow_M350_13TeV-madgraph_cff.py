import FWCore.ParameterSet.Config as cms

# link to cards:
# https://github.com/cms-sw/genproductions/tree/5433e79367a9573b24d268f207a638922ba1e19b/bin/MadGraph5_aMCatNLO/cards/production/13TeV/exo_diboson/Spin-2/BulkGraviton_hh_htatahbb/BulkGraviton_hh_htatahbb_narrow_M350


externalLHEProducer = cms.EDProducer("ExternalLHEProducer",
    args = cms.vstring('/cvmfs/cms.cern.ch/phys_generator/gridpacks/slc6_amd64_gcc481/13TeV/madgraph/V5_2.2.2/exo_diboson/Spin-2/BulkGraviton_hh_htatahbb/narrow/v1/BulkGraviton_hh_htatahbb_narrow_M350_tarball.tar.xz'),
    nEvents = cms.untracked.uint32(5000),
    numberOfParameters = cms.uint32(1),
    outputFile = cms.string('cmsgrid_final.lhe'),
    scriptName = cms.FileInPath('GeneratorInterface/LHEInterface/data/run_generic_tarball_cvmfs.sh')
)
