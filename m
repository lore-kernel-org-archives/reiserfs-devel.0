From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: silent semantic changes with reiser4
Date: Mon, 30 Aug 2004 21:10:34 -0400
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <878ybwxgc5.fsf@uhoreg.ca>
References: <Pine.LNX.4.44.0408272158560.10272-100000@chimarrao.boston.redhat.com> <Pine.LNX.4.58.0408271902410.14196@ppc970.osdl.org>
 <20040828170515.GB24868@hh.idb.hist.no>
 <Pine.LNX.4.58.0408281038510.2295@ppc970.osdl.org>
 <4131074D.7050209@namesys.com>
 <16691.16656.726300.438533@gargle.gargle.HOWL> <87fz64xidx.fsf@uhoreg.ca>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-fsdevel@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

>>>>> "Hubert" == Hubert Chan <hubert@uhoreg.ca> writes:
>>>>> "John" == John Stoffel <stoffel@lucent.com> writes:

[...]

John> The big point of this paper though was to make the syntax simple,
John> and the semantics clear and unambiguous.  For example, they point
John> out how the "Cedar" file system added in VMS style version numbers
John> to filenames with the syntax "<name>!<version>" and they pointedly
John> ask what does "/usr/rob!3/bin/cat-v mean?  Which I think just
John> points out that the syntax of streams (metas) needs be carefully
John> thought out, and how that syntax implies various semantics.

Hubert> The problem isn't just with things being confusing.  It's also
Hubert> about making things accessible through a unified interface. ...

By the way, "The Hideous Name" mentions this just briefly (in the
"Properties of Name Spaces" section).  A better paper, IMHO, about this
is "The Use of Name Spaces in Plan 9" (Rob Pike, Dave Presotto, Ken
Thompson, Howard Trickey, Phil Winterbottom; Operating Systems Review,
Num. 2, Vol 27, April 1993 pp. 72-76)

http://www.cs.bell-labs.com/sys/doc/names.pdf
or
http://www.cs.bell-labs.com/sys/doc/names.html

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

