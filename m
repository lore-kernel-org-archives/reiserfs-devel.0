From: James Bruce <bruce@andrew.cmu.edu>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 12:07:37 -0400
Message-ID: <412E0AC9.2020203@andrew.cmu.edu>
References: <20040824202521.GA26705@lst.de>	<412CEE38.1080707@namesys.com>	<20040825152805.45a1ce64.akpm@osdl.org>	<112698263.20040826005146@tnonline.net>	<Pine.LNX.4.58.0408251555070.17766@ppc970.osdl.org>	<1453698131.20040826011935@tnonline.net>	<20040825163225.4441cfdd.akpm@osdl.org>	<20040825233739.GP10907@legion.cup.hp.com>	<20040825234629.GF2612@wiggy.net>	<1939276887.20040826114028@tnonline.net>	<20040826024956.08b66b46.akpm@osdl.org>	<839984491.20040826122025@tnonline.net>	<20040826032457.21377e94.akpm@osdl.org>	<742303812.20040826125114@tnonline.net> <20040826035500.00b5df56.akpm@osdl.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20712-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040826035500.00b5df56.akpm@osdl.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Andrew Morton <akpm@osdl.org>
Cc: Spam <spam@tnonline.net>, wichert@wiggy.net, jra@samba.org, torvalds@osdl.org, reiser@namesys.com, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

Andrew Morton wrote:

>No.  All of the applications which you initially identified can be
>implemented by putting the various bits of data into a single file and
>getting applications to agree on the format of that file.
>  
>

So in order to avoid breaking backup and file utilities, we'd instead 
break every application that reads files?  That way surely lies madness 
:)  This /could/ possibly work with lots of cooperation from glibc, but 
we'd also need a way to insert and delete bytes in a file... moving 1MB 
of attributes/streams just to change a 20 character author attribute 
seems a bit silly.  In addition, there are little things, such as how 
adding a thumbnail image shouldn't change the modification time of the 
original picture IMO, but it does if you embed it in the file.

If it should be in userspace, we could take the OS-X approach of using 
directories for everything, and the "data" that would be in a hybrid 
directory-file is a specially named file under that directory.  Programs 
for instance are actually directories, with the elf file underneath it.  
When you click on the "directory-program" in the gui it runs the 
associated elf file rather than opening the directory.  I think that 
approach is promising, but so few unix programs have any indirection for 
file access it'd be hell to teach them all how it works.  Of course with 
emminent breakage of some sort, maybe now is the time...

 - Jim Bruce

