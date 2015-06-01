import FWCore.ParameterSet.Config as cms

# link to cards:
# https://github.com/cms-sw/genproductions/tree/afad53082a334f6e6ad4a3769124ccc50b8e8991/bin/MadGraph5_aMCatNLO/cards/production/13TeV/exo_diboson/Spin-1/Wprime_Wh_Wlephtata/Wprime_Wh_Wlephtata_narrow_M4500


externalLHEProducer = cms.EDProducer("ExternalLHEProducer",
    args = cms.vstring('/cvmfs/cms.cern.ch/phys_generator/gridpacks/slc6_amd64_gcc481/13TeV/madgraph/V5_2.2.2/exo_diboson/Spin-1/Wprime_Wh_Wlephtata/narrow/v1/Wprime_Wh_Wlephtata_narrow_M4500_tarball.tar.xz'),
    nEvents = cms.untracked.uint32(5000),
    numberOfParameters = cms.uint32(1),
    outputFile = cms.string('cmsgrid_final.lhe'),
    scriptName = cms.FileInPath('GeneratorInterface/LHEInterface/data/run_generic_tarball_cvmfs.sh')
)
