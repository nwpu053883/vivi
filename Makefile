ifneq ($(KERNELRELEASE), )
	obj-m+=fillbuf.o
	obj-m+=vivi.o
else
KERN_VERS=$(shell uname -r)
KERN_DIR=/lib/modules/$(KERN_VERS)/build

new:drivers

drivers:
	make -C $(KERN_DIR) M=$(PWD) modules

clean:
	make -C $(KERN_DIR) M=$(PWD) clean

endif
