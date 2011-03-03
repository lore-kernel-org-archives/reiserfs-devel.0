From: "Jaroslav Fojtik" <jafojtik@seznam.cz>
Subject: Re8: Question about reiser performance - linux-2.6.37 crash reproduced
Date: Fri, 04 Mar 2011 00:24:25 +0100
Message-ID: <4D702329.27637.A07FE@jafojtik.seznam.cz>
References: <4D65A3F7.22052.1288FE@jafojtik.seznam.cz>, <4D700778.5161.11EDF7@jafojtik.seznam.cz>, <4D701197.7030903@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-reply-to: <4D701197.7030903@gmail.com>
Content-description: Mail message body
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward.shishkin@gmail.com>, reiserfs-devel@vger.kernel.org

Dear Edward Shishkin,

> Great.

Sorry, after several attempts I managed to crash Linux even with kernel
linux-2.6.37. No trace in log, system completely frozen and beeper
sounded.

It takes several hours to transfer 400 Gigabyte test data and create
full stress of filesystem.

I have improved my stress test and managed to find something with mc 
paralelly with data copying.

regards
   Jara


I hope that my hardware is clean enough because I have never see this crash
with Linux 2.6.34.

