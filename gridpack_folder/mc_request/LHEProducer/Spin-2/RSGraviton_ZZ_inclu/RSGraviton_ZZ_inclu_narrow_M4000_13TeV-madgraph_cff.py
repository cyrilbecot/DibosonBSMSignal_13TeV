import FWCore.ParameterSet.Config as cms

# link to cards:
# https://github.com/cms-sw/genproductions/tree/527596440ac4152751ef21a01e90cc2b5f8cfcb9/bin/MadGraph5_aMCatNLO/cards/production/13TeV/exo_diboson/Spin-2/RSGraviton_ZZ_inclu/RSGraviton_ZZ_inclu_narrow_M4000


externalLHEProducer = cms.EDProducer("ExternalLHEProducer",
    args = cms.vstring('/cvmfs/cms.cern.ch/phys_generator/gridpacks/slc6_amd64_gcc481/13TeV/madgraph/V5_2.2.2/exo_diboson/Spin-2/RSGraviton_ZZ_inclu/narrow/v1/RSGraviton_ZZ_inclu_narrow_M4000_tarball.tar.xz'),
    nEvents = cms.untracked.uint32(5000),
    numberOfParameters = cms.uint32(1),
    outputFile = cms.string('cmsgrid_final.lhe'),
    scriptName = cms.FileInPath('GeneratorInterface/LHEInterface/data/run_generic_tarball_cvmfs.sh')
)
