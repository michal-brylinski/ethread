#===============================================================================
#           _______ __                        __ 
#   .-----.|_     _|  |--.----.-----.---.-.--|  |
#   |  -__|  |   | |     |   _|  -__|  _  |  _  |
#   |_____|  |___| |__|__|__| |_____|___._|_____|
#                                                  
#   eThread - protein structure modeling by meta-threading
#
#   This software is distributed WITHOUT ANY WARRANTY (but with best wishes)
#
#   Report bugs and issues to michal@brylinski.org
#
#   Computational Systems Biology Group
#   Department of Biological Sciences
#   Center for Computation & Technology
#   Louisiana State University
#   407 Choppin Hall, Baton Rouge, LA 70803, USA
#
#   http://www.brylinski.org
#
#===============================================================================


EXE = ethread ethread_extract ethread_model ethread_model_parallel ethread_rank ethread_prune ethread_rfc_h.py ethread_rfc_l.py ethread_rfc_lig.py ethread_rfc_pkt.py ethread_rfc_hete_isc.py ethread_rfc_hete_mcc.py ethread_rfc_homo_isc.py ethread_rfc_homo_mcc.py

SH = sh

PYTHON = /var/scratch/michal/apps/anaconda3/bin/python

default: $(EXE)

models:
	@echo making model 1/8:
	$(PYTHON) model_rfc_h.py
	@echo making model 2/8:
	$(PYTHON) model_rfc_l.py
	@echo making model 3/8:
	$(PYTHON) model_rfc_lig.py
	@echo making model 4/8:
	$(PYTHON) model_rfc_pkt.py
	@echo making model 5/8:
	$(PYTHON) model_rfc_hete_isc.py
	@echo making model 6/8:
	$(PYTHON) model_rfc_hete_mcc.py
	@echo making model 7/8:
	$(PYTHON) model_rfc_homo_isc.py
	@echo making model 8/8:
	$(PYTHON) model_rfc_homo_mcc.py

ethread:
	$(SH) ethread.shar
	@chmod +x ethread
	@mv ethread ../bin/

ethread_extract:
	$(SH) ethread_extract.shar
	@chmod +x ethread_extract
	@mv ethread_extract ../bin/

ethread_model:
	$(SH) ethread_model.shar
	@chmod +x ethread_model
	@mv ethread_model ../bin/

ethread_model_parallel:
	$(SH) ethread_model_parallel.shar
	@chmod +x ethread_model_parallel
	@mv ethread_model_parallel ../bin/

ethread_rank:
	$(SH) ethread_rank.shar
	@chmod +x ethread_rank
	@mv ethread_rank ../bin/

ethread_prune:
	$(SH) ethread_prune.shar
	@chmod +x ethread_prune
	@mv ethread_prune ../bin/

ethread_rfc_h.py:
	$(SH) ethread_rfc_h.py.shar
	@chmod +x ethread_rfc_h.py
	@mv ethread_rfc_h.py ../bin/

ethread_rfc_l.py:
	$(SH) ethread_rfc_l.py.shar
	@chmod +x ethread_rfc_l.py
	@mv ethread_rfc_l.py ../bin/

ethread_rfc_lig.py:
	$(SH) ethread_rfc_lig.py.shar
	@chmod +x ethread_rfc_lig.py
	@mv ethread_rfc_lig.py ../bin/

ethread_rfc_pkt.py:
	$(SH) ethread_rfc_pkt.py.shar
	@chmod +x ethread_rfc_pkt.py
	@mv ethread_rfc_pkt.py ../bin/

ethread_rfc_hete_isc.py:
	$(SH) ethread_rfc_hete_isc.py.shar
	@chmod +x ethread_rfc_hete_isc.py
	@mv ethread_rfc_hete_isc.py ../bin/

ethread_rfc_hete_mcc.py:
	$(SH) ethread_rfc_hete_mcc.py.shar
	@chmod +x ethread_rfc_hete_mcc.py
	@mv ethread_rfc_hete_mcc.py ../bin/

ethread_rfc_homo_isc.py:
	$(SH) ethread_rfc_homo_isc.py.shar
	@chmod +x ethread_rfc_homo_isc.py
	@mv ethread_rfc_homo_isc.py ../bin/

ethread_rfc_homo_mcc.py:
	$(SH) ethread_rfc_homo_mcc.py.shar
	@chmod +x ethread_rfc_homo_mcc.py
	@mv ethread_rfc_homo_mcc.py ../bin/

clean:
	@(rm -f ../bin/* )

clean_models:
	@(rm -f ../mod/ethread_* )
