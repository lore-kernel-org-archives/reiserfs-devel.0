From: "Raymond A. Meijer" <rmeijer@internet.gr>
Subject: Re: Working Reiser4 patch for kernel 2.6.6(-mm2)?
Date: Thu, 3 Jun 2004 17:04:09 +0300
Message-ID: <200406031704.09685.rmeijer@internet.gr>
References: <200406021554.11690.rmeijer@internet.gr> <200406031417.51895.rmeijer@internet.gr> <200406031551.43093.rmeijer@internet.gr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18994-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200406031551.43093.rmeijer@internet.gr>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Thu 3 June 2004 15:51, Raymond A. Meijer wrote:

> So, I'll recompile a vanilla kernel with no optimisations and only the mm
> and Reiser4 patches applied...

No, still the same: Oops errors when the kernel tries to mount Reiser4 
filesystems...

...but then I converted most of the system partitions (/var, /home, /usr) to 
ReiserFS and kept some other partitions in Reiser4 format (/backup, /tmp,
/var/spool/squid) and now it DOES work properly!

2.6.6-mm2 boots up fine, mounts everything and starts everything. I'm actually 
sending this mail with KMail on KDE 3.2.2 on kernel 2.6.6-mm2...

Any ideas as to what happened?! :)


Ray
