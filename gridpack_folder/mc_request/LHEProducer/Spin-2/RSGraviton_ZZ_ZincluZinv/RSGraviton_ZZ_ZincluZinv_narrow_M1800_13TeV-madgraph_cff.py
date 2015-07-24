import FWCore.ParameterSet.Config as cms

# link to cards:
# https://github.com/cms-sw/genproductions/tree/3416cb09b257642b1355134d78814c249a8e1139/bin/MadGraph5_aMCatNLO/cards/production/13TeV/exo_diboson/Spin-2/RSGraviton_ZZ_ZincluZinv/RSGraviton_ZZ_ZincluZinv_narrow_M1800


externalLHEProducer = cms.EDProducer("ExternalLHEProducer",
    args = cms.vstring('/cvmfs/cms.cern.ch/phys_generator/gridpacks/slc6_amd64_gcc481/13TeV/madgraph/V5_2.2.2/exo_diboson/Spin-2/RSGraviton_ZZ_ZincluZinv/narrow/v1/RSGraviton_ZZ_ZincluZinv_narrow_M1800_tarball.tar.xz'),
    nEvents = cms.untracked.uint32(5000),
    numberOfParameters = cms.uint32(1),
    outputFile = cms.string('cmsgrid_final.lhe'),
    scriptName = cms.FileInPath('GeneratorInterface/LHEInterface/data/run_generic_tarball_cvmfs.sh')
)
