From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: kernel BUG() hit during PCI testing
Date: Tue, 10 May 2005 14:25:47 -0400
Message-ID: <4280FCAB.1020600@suse.com>
References: <20050509222314.GA17876@austin.ibm.com> <4280E05D.6000000@suse.com> <20050510173448.GQ11745@austin.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24031-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050510173448.GQ11745@austin.ibm.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linas Vepstas <linas@austin.ibm.com>
Cc: reiserfs-dev@namesys.com, reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Linas Vepstas wrote:
> HI,
> 
> On Tue, May 10, 2005 at 12:25:01PM -0400, Jeff Mahoney was heard to remark:
>>This one is on my radar among several others of the same type. What's
>>happening is that somehow buffers are getting dirtied despite not being
>>uptodate. They're getting allowed to be put back into the write cycle
>>which is totally invalid, so they're getting caught rather than being
>>written to disk. ext3 has similar problems, but tends to handle them as
>>buffer errors rather than BUGs. I'm investigating whether or not these
>>errors could occur outside individual filesystems.
> 
> OK, if I don't get busy with other things, I'll look more closely at
> this as well. Maybe :-/    Meanwhile here's the dmesg output between
> the pci outage and the crash.  Don't know if this will be useful.
> If you want any kind of tracing turned on, let me know.

It should be just a matter of performing an audit of where these buffers
are getting re-introduced into the write cycle. I don't really need any
more data points, I've got quite a bit already from various reports.
Thanks though.

- -Jeff

- --
Jeff Mahoney
SuSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.0 (GNU/Linux)

iD8DBQFCgPyrLPWxlyuTD7IRAmeEAJ9coIRFqDgtcR6/HM2W3Ub6cDCnPQCdEfDD
n98S1iOxoEdrFwASM8FRohE=
=/v+v
-----END PGP SIGNATURE-----
