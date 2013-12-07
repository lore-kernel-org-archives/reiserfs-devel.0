From: Mathieu Belanger <m@thieu.so>
Subject: reiser4 for 3.12
Date: Sat, 07 Dec 2013 16:59:03 +0000
Message-ID: <20131207165903.Horde.CKIrJx0drBGwOg6KTccWIQ1@mail.thieu.so>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="Yes"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel <reiserfs-devel@vger.kernel.org>

I have updated my git tree for kernel 3.12.

No change for reiser4 since 3.12-rc2.

Change since 3.11 :
  - Shrinker API change
  - Patch from Edward for enerasable directory (I think)

Note, I did not test it with 3.12 final yet. I still have a busy day  
so have fun!

Shrinker API change can be viewed here :  
https://github.com/DestroyFX/reiser4/commits/reiser4-for-3.12-rc2
Current kernel 3.12 git  :  
https://github.com/DestroyFX/reiser4/commits/reiser4-for-3.12
Patch Here : http://mirror.nxtoo.org/reiser4-for-3.12.patch.bz2
