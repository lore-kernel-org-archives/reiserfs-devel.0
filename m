From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: fsck.reiser4 wrong size error (?)
Date: Fri, 13 Aug 2004 14:10:36 +0300
Message-ID: <20040813111036.GL1284@nysv.org>
References: <200408122138.46787.frbiscani@jumpy.it> <200408130031.13061.vitaly@namesys.com> <200408122308.06962.frbiscani@jumpy.it> <20040813091612.GF13834@backtop.namesys.com> <20040813093119.GI1284@nysv.org> <411C8D45.1000709@namesys.com> <20040813094431.GJ1284@nysv.org> <16668.37156.126350.883214@laputa.namesys.com> <20040813100155.GK1284@nysv.org> <411C9BEB.2030209@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20263-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <411C9BEB.2030209@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: reiserfs-list@namesys.com

On Fri, Aug 13, 2004 at 02:46:03PM +0400, Vladimir V. Saveliev wrote:
>>But you may remember what happened when I last tried to touch Reiser4
>>code and VFS ;)
>Sorry, i do not. What was it?

Nikita gave me the theory on how to access metas/ on read-only files
by hacking a new attribute into VFS.

Unfortunately it first rendered all files inaccessible by anyone but
root and when I tried to add debug code the kernel would panic at boot.

Then I didn't have time to pursue the matter.
Besides, I don't think all filesystem maintainers would like that feature.

-- 
mjt

