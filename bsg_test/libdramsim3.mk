BASEJUMP_STL_DIR :=$(shell git rev-parse --show-toplevel)

CXXFLAGS = -std=c++14 -D_GNU_SOURCE -Wall -fPIC -shared
CXXFLAGS += -I$(BASEJUMP_STL_DIR)/imports/DRAMSim3/src
CXXFLAGS += -I$(BASEJUMP_STL_DIR)/imports/DRAMSim3/ext/headers
CXXFLAGS += -I$(BASEJUMP_STL_DIR)/imports/DRAMSim3/ext/fmt/include
CXXFLAGS += -I$(BASEJUMP_STL_DIR)/bsg_mem
CXXFLAGS += -DFMT_HEADER_ONLY=1
CXXFLAGS += -DCMD_TRACE
CXXFLAGS += -DBASEJUMP_STL_DIR=$(BASEJUMP_STL_DIR)
DRAMSIM3_SRC =  $(BASEJUMP_STL_DIR)/imports/DRAMSim3/src/bankstate.cc
DRAMSIM3_SRC += $(BASEJUMP_STL_DIR)/imports/DRAMSim3/src/channel_state.cc
DRAMSIM3_SRC += $(BASEJUMP_STL_DIR)/imports/DRAMSim3/src/command_queue.cc
DRAMSIM3_SRC += $(BASEJUMP_STL_DIR)/imports/DRAMSim3/src/common.cc
DRAMSIM3_SRC += $(BASEJUMP_STL_DIR)/imports/DRAMSim3/src/configuration.cc
DRAMSIM3_SRC += $(BASEJUMP_STL_DIR)/imports/DRAMSim3/src/controller.cc
DRAMSIM3_SRC += $(BASEJUMP_STL_DIR)/imports/DRAMSim3/src/dram_system.cc
DRAMSIM3_SRC += $(BASEJUMP_STL_DIR)/imports/DRAMSim3/src/hmc.cc
DRAMSIM3_SRC += $(BASEJUMP_STL_DIR)/imports/DRAMSim3/src/memory_system.cc
DRAMSIM3_SRC += $(BASEJUMP_STL_DIR)/imports/DRAMSim3/src/refresh.cc
DRAMSIM3_SRC += $(BASEJUMP_STL_DIR)/imports/DRAMSim3/src/simple_stats.cc
DRAMSIM3_SRC += $(BASEJUMP_STL_DIR)/imports/DRAMSim3/src/timing.cc
DRAMSIM3_SRC += $(BASEJUMP_STL_DIR)/bsg_test/bsg_dramsim3.cpp
DRAMSIM3_SRC += $(BASEJUMP_STL_DIR)/bsg_mem/bsg_mem_dma.cpp

libdramsim3.so: $(DRAMSIM3_SRC)
	$(CXX) $(CXXFLAGS) -o $@ $^
