From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: An alternative to UML for develop
Date: Fri, 29 Aug 2003 17:25:09 +0400
Message-ID: <16207.21557.718563.426844@laputa.namesys.com>
References: <200308260109.54130.postnet@dragas.dyndns.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15494-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200308260109.54130.postnet@dragas.dyndns.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Stefano Marinelli <postnet@dragas.dyndns.org>
Cc: reiserfs-list@namesys.com

Stefano Marinelli writes:
 > Hi there. Some months ago I've enjoyed a talk by Hans Reiser about 
 > reiserfs at Bologna's University (Italy) and, after talking a bit with 
 > him, I've discovered you use User Mode Linux a lot for testing. 
 > So I wanted to inform you about a new project called qemu. At first it 
 > was just a cpu emulator to launch x86 software on non-x86 archs, but 
 > now is becoming a real Virtual Machine emulator. The main benefits are 
 > that you don't have to patch the host kernel (just do a little 
 > modification to guest's kernel, but it will be fixed soon) and can 
 > launch a complete operating system as a total user process.
 > So it may have many advantages against UML. The project is running fast, 
 > the developer is a nice person so I think you could be interested in 
 > having a look at http://fabrice.bellard.free.fr/qemu/

Yes, should be useful. Does it allows to do things like:

1. profiling
2. measuring cache contention
3. measuring overhead of interlocked operation?

 > Last stable is Jul,14 but on last cvs there are a lot of add-ons!
 > Hope it helps, and thanks for the wonderful reiserfs!
 > 
 > Stefano
 > 

Nikita.
