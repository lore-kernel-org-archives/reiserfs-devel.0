From: Oleg Drokin <green@namesys.com>
Subject: Re: Copy time comparison 2.4.20-pre6 <-> 2.4.19+data-logging (was:Compatibility of  current 2.4.19.pending ...)
Date: Tue, 17 Sep 2002 18:00:35 +0400
Message-ID: <20020917180035.A15755@namesys.com>
References: <3D7FDEA5.7040806@mb.tu-ilmenau.de> <3D81076E.6090408@mb.tu-ilmenau.de> <20020913113735.A6022@namesys.com> <3D826FB9.7030909@mb.tu-ilmenau.de> <20020914130239.D26664@namesys.com> <3D867C14.5060404@mb.tu-ilmenau.de> <20020917103321.C25766@namesys.com> <3D87347D.8030504@mb.tu-ilmenau.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11495-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3D87347D.8030504@mb.tu-ilmenau.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Cc: reiserfs-list <reiserfs-list@namesys.com>

Hello!

On Tue, Sep 17, 2002 at 03:56:13PM +0200, Manuel Krause wrote:
> >>not?! I calculated these values manually based upon the timings & df 
> >>values after copying. Yes, I want to show my personal engagement for the 
> >>reiserfs community, too.
> >Hm. Are you sure you are hitting write-speed limit?
> >May be you are read-speed bounded? Can you please check that?
> How can I check this? E.g. with some dd process? I just don't know.

Copy same amount of data from RAM/nowhere to FS.
E.g. make a file with file names and sizes and write a script that
writes this amount of data from /dev/zero with these same names and needed sizes
into FS. (or just use RAMFS as your source if you have not much data and huge
RAM)
Compare 2.4.20-pre[67] if you see any difference.
Ah, also copy your data from original disk location to /dev/null and measure
time of that operation to know how much of total time is occupied by reads.

Also you can calculate read and write throughput separately this way.
And if reads are slower than writes - ...

Bye,
    Oleg
