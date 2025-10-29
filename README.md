# explicitAdaptation
Data and code for 'Sensorimotor confidence during explicit motor adaptation' manuscript. 

Abstract
Humans can adapt to large and sudden perturbations of sensory feedback. What
multisensory and motor-execution cues are used to determine confidence in
action success, and do the dynamics of confidence parallel those of ongoing
sensorimotor adaptation? Participants made a slicing reach through a visual
target with an unseen hand, followed by a continuous judgment of confidence in
reach success. For the confidence judgment, participants adjusted the size of an
arc centered on the target. Larger arcs reflected lower confidence. Points were
awarded if the subsequent visual feedback was within the arc, and fewer points
returned for larger arcs. This incentivized attentive reporting of confidence and
minimizing feedback-target distance to maximize the score. After the confidence
response, visual feedback of hand position was shown at the same distance
along the reach as the target. A 20 deg rotation was applied to the feedback
during the central 50 trials of a block (alternating between clockwise and
counterclockwise across blocks). We used least-squares cross validation to
compare four Bayesian-inference models of sensorimotor confidence using
prospective cues (knowledge of motor noise and visual feedback from past
performance), retrospective cues (proprioceptive measurements), or both
sources of information integrated to maximize expected gain (an ideal observer)
with additional parameters for learning and bias. All but one of the participants
used proprioception to calculate sensorimotor confidence during motor
adaptation in addition to prior information. Confidence recovered exponentially to
pre-adaptation levels after the perturbation ended, but at a slower rate than motor
learning.

Participants
Sixteen self-reported right-handed individuals were selected from the New York
University student body (average age: 24 years, SD: 4.9 years, 6 males). None of the
participants were familiar with the experimental design. All participants had either
normal or corrected-to-normal vision, no restrictions on their right arm’s mobility, and
reported no motor abnormalities. Every participant completed both the control motor-
awareness task (Task 1) and the primary confidence-judgment task (Task 2).

Experimental Files
The experimental set up involves a Wacom Cintiq 22 tablet placed on a table below a projector.
The experimental code runs under the assumption there are 3 screens in use (main computer, tablet and projector). 
PsychToolBox runs all visualizations through Matlab

Data is collected through the pen position via GetMouse() and with a Griffin PowerMate control knob using PsychPowerMate()

'PerturbExpCode.m' is the main shell for running the experiment. This is where you can enter the participant specifications and request the
control experiment or practice trials. This calls all the other functions in the file accordingly. 

Analysis
The primary analysis was performed using the BADS package https://github.com/acerbilab/bads in parallel processing on an HPC cluster. 
All relevant files are in the 'data' folder but to follow the process yourself run the files in this order:
1: ModelSim.m (generates .mat files for a LS grid using simulations of the models)
2: LSoutMatGen.m (preprocesses the data from the experiment and calculates likely starting points for the BADS search to reduce computation time)
3: subj_parpoolModelMinBads.m (runs BADS search)

Other analysis files have been includes to check some behavioral aspects of the data and look at simulations. 
