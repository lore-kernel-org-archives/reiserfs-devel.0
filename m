From: "Jaroslav Fojtik" <jafojtik@seznam.cz>
Subject: Re10: Question about reiser performance - linux-2.6.37 crash reproduced
Date: Fri, 04 Mar 2011 00:38:25 +0100
Message-ID: <4D702671.25218.16D74A@jafojtik.seznam.cz>
References: <4D65A3F7.22052.1288FE@jafojtik.seznam.cz>, <4D702329.27637.A07FE@jafojtik.seznam.cz>, <4D702444.6000806@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-reply-to: <4D702444.6000806@gmail.com>
Content-description: Mail message body
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward.shishkin@gmail.com>, reiserfs-devel@vger.kernel.org

Dear Edward Shishkin,

> > I have improved my stress test and managed to find something with mc
> > paralelly with data copying.
> 
> Ok, I'll try to reproduce.
> Is you "/" on reiser4 partition?

No, I mount different drive as /J/. 
I have no courage to perpentually reinstall OS.

Try to search paralelly with several "mc" and locate some string in files.
And copy something to a drive.

I have hexacore CPU, I do not know whether issue would be reproducible with 
single core unit.

best regards
   Jara
