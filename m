From: Michal Piotrowski <michal.k.k.piotrowski@gmail.com>
Subject: [1/2] 2.6.22-rc5: known regressions v2
Date: Thu, 21 Jun 2007 18:34:51 +0200
Message-ID: <467AA8AB.2010107@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:user-agent:mime-version:to:subject:content-type:content-transfer-encoding:from;
        b=m4VarHy7KrS4qO5bd4p6W/Bc6pd1c+UYvy5xcZp5J8qVUpALKZgfqNffV3O/l0GhtUO2XaUVnGzkyprc7yQcT3DEtzY6sXHdNT1o2LdgwuMDbGOn27Zckq/OHKAVnsvA7/c5bl81ZKN5QYGAI9MFzVkaraJRKgAdHbkeKs0SHgI=
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, Andi Kleen <ak@suse.de>, Rodrigo Luiz <troops.of.doom@gmail.com>, CHIKAMA Masaki <masaki-c@nict.go.jp>, Christian Volkmann <haveaniceday@cv-sv.de>, Takashi Iwai <tiwai@suse.de>, Jaroslav Kysela <perex@suse.cz>, Ben Collins <bcollins@ubuntu.com>, reiserfs-devel@vger.kernel.org, "Vladimir V. Saveliev" <vs@namesys.com>, Randy Dunlap <randy.dunlap@oracle.com>

Hi all,

Here is a list of some known regressions in 2.6.22-rc5.

Feel free to add new regressions/remove fixed etc.
http://kernelnewbies.org/known_regressions

(BTW. There is a new category called "Will be fixed in 2.6.23")



Unclassified

Subject    : PANIC: CPU too old for this kernel. with Crusoe CPU
References : http://bugzilla.kernel.org/show_bug.cgi?id=8647
Submitter  : CHIKAMA Masaki <masaki-c@nict.go.jp>
Caused-By  : Andi Kleen <ak@suse.de>
             or Christian Volkmann <haveaniceday@cv-sv.de>
             one of those commits:
             commit 4c1f59d8be7e5da75d9380da23671005b363c45c
             commit 39427d6e595ebee38fdd77bcf55d6b13d7a4324a
             commit fd0581bbb40d8f4b0e4b3a4de2258a50df37bb57
             commit c7f81c9453375d6416658995eafd3397cb9bba1d
             commit 3671df8572a299acff9c9cac2bf7279ee614d154
Status     : unknown

Subject    : Kernel hang on CMOS_READ
References : http://lkml.org/lkml/2007/6/3/138
Submitter  : Rodrigo Luiz <troops.of.doom@gmail.com>
Status     : Unknown



ALSA

Subject    : snd-aoa causes badness in lib/kref.c:33
References : http://bugzilla.kernel.org/show_bug.cgi?id=8513
Submitter  : Ben Collins <bcollins@ubuntu.com>
Handled-By : Takashi Iwai <tiwai@suse.de>
Status     : Unknown



FS

Subject    : 2.6.22-rc4-git5 reiserfs: null ptr deref.
References : http://lkml.org/lkml/2007/6/13/322
Submitter  : Randy Dunlap <randy.dunlap@oracle.com>
Handled-By : Vladimir V. Saveliev <vs@namesys.com>
Status     : problem is being debugged



Regards,
Michal

--
LOG
http://www.stardust.webpages.pl/log/
