From: Mathieu Belanger <m@thieu.so>
Subject: Merry Christmas and happy reiser4-for-3.13-rc5 testing!
Date: Wed, 25 Dec 2013 05:38:08 +0000
Message-ID: <20131225053808.Horde.JC_4ggCEiNr0rzYa86ePaw8@mail.thieu.so>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="Yes"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel <reiserfs-devel@vger.kernel.org>


Hi!

I just updated the reiser4 patch for the kernel 3.13-rc5 available on  
my git : https://github.com/DestroyFX/reiser4 or directly there :  
http://mirror.nxtoo.org/reiser4-for-3.13.patch.gz

What changed is the wb_writeback_work struct in fs/fs-writeback.c so I  
changed it with the new var "unsigned int older_than_this_is_set:1;"  
from the 3.13 and the order of the variables changed too... The rest  
passed fine.

It compile!
I did not test it (it's actually my only PC with Reiser4 partitions  
and I can't really reboot a new kernel for now (mining coins with  
these 6 Radeon 7970)

Happy testing and Merry Christmas!
