From: =?UTF-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>
Subject: Reiser4 inclusion into staging tree
Date: Sun, 2 Nov 2014 10:09:37 +0100
Message-ID: <CADW=+3knfdvLiuFRNWdA5PQjq+fg-iC+D6NNqV9y8=vewig-hw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=dhxs/0U0KZGnNQ1ZPXec6UqlRxIstXt8p+5iXllvZe0=;
        b=g4tb2v+wRpSgfsy9lCVoSCVZasOIZv382pdxyxX0V+vO3VzeTqRqqAOa6MquPj08fK
         /tja6UJ1Ga24FjgZODzjR/CZ2qs+27f3Ja/HB2LORB63RHkQDarAbjl7GNE5VrZRupRy
         s3VEFQVQnPhdEeE0QEIio+vnF+KPmLuctuZ651IubSAoV/BHjCIyT5zoI6WBjBYbwN+G
         aC9x7NvzW4P2IXTazqQweypAubATzpUdCkQRvEcOtyI8NmhGFNZ+abg1rkL+U0jqqKUj
         fWphiAmt7zLMv/rN6xMuo/TRTAUlaIfoetq8GHc+Xl46IzV0pjMvzBNlzglBfvQpznFA
         Bu/Q==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel <reiserfs-devel@vger.kernel.org>, Edward Shishkin <edward.shishkin@gmail.com>, Ivan Shapovalov <intelfx100@gmail.com>

I've made a poll on forums.gentoo.org with a question:" What Reiser4
needs for you to start using it?" and with these offered answers I got
following results:

http://forums.gentoo.org/viewtopic-t-1002726-postdays-0-postorder-asc-start-25.html

Mainline inclusion
 45%
Encryption
 0%
Snapshots
 0%
Defrag
 0%
Performance
 0%
Subvolumes
 0%
Grub2 support
 0%
Something else
 31%
It's already perfect
 4%
I'd never use it
 18%


Something else were users that asked for checksums (we do that for
ccreg40 partitions or files? what about reg40? just sizes AFAIK?), SSD
support, fixing undeletable dir bug, long mount times (if the large
partition is / does dont_load_bitmap have to be in boot options or it
can be in /etc/fstab?)...

Based on these results (even on a small portion of linux user base
that's traditionally been positive about reiser4) I really think that
taking Reiser4 to the staging tree could be the move that would show
users that the R4 development has some goal and is not dying down and
with that would come influx of new users/developers.

Ofc this is just my wish as I don't have the knowlege or right to push
it to staging but if there's anything you can think of that I can do
to help (I have one extra machine just waiting for some R4 testing)
please tell me.

Thanks a lot for your great work

Dushan
