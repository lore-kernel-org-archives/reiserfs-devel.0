From: Hans Reiser <reiser@namesys.com>
Subject: Re: reiser4 plugins
Date: Sat, 28 Aug 2004 14:41:12 -0700
Message-ID: <4130FBF8.8070005@namesys.com>
References: <20040826014542.4bfe7cc3.akpm@osdl.org> <1093522729.9004.40.camel@leto.cs.pocnet.net> <20040826124929.GA542@lst.de> <1093525234.9004.55.camel@leto.cs.pocnet.net> <20040826130718.GB820@lst.de> <1093526273.11694.8.camel@leto.cs.pocnet.net> <20040826132439.GA1188@lst.de> <20040828105929.GB6746@alias> <Pine.LNX.4.58.0408281011280.2295@ppc970.osdl.org> <20040828190350.GA14152@alias> <20040828190901.GA18083@lst.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21021-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040828190901.GA18083@lst.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linus Torvalds <torvalds@osdl.org>
Cc: Christoph Hellwig <hch@lst.de>, flx@msu.ru, Christophe Saout <christophe@saout.de>, Andrew Morton <akpm@osdl.org>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

I think it is reasonable to make the -nopseudos (turns off the metafiles 
) mount option mandatory, until the bugs are resolved.

Our testing did not find these metafile/VFS bugs because of the reason 
for all our bugs, we screwed up. 

There is a distinct difference between some persons and I, which is that 
some think all of reiser4 should be excluded until metafiles are 
implemented by VFS some long time from now, and I, in that I merely 
think buggy optional features should be turned off until they are 
fixed.  I, being renowned for my paranoia and asininity as I am, think 
these persons find it convenient as an excuse to keep us from competing, 
and I think that if we were slower there would be less hassle every time 
we try to get into the kernel. 

While reiser4 has some significant roughnesses remaining in its 
performance, I think the average user would find it performs better than 
other filesystems, and is stable enough for, say, a laptop, and I 
predict that by the time we have it stable enough for mission critical 
servers, all the roughness in various important corner cases will be 
gone.  

Persons benchmarking it with tarballs, please be sure to use tarballs 
created on reiser4, not ext2 tarballs, readdir order matters a lot for 
sorted directory filesystems.

Hans
