From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: silent semantic changes with reiser4
Date: Tue, 31 Aug 2004 14:28:26 -0400
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <87n00bmab9.fsf@uhoreg.ca>
References: <20040825204240.GI21964@parcelfarce.linux.theplanet.co.uk> <Pine.LNX.4.58.0408251348240.17766@ppc970.osdl.org>
 <20040825212518.GK21964@parcelfarce.linux.theplanet.co.uk>
 <20040826001152.GB23423@mail.shareable.org>
 <20040826003055.GO21964@parcelfarce.linux.theplanet.co.uk>
 <20040826010049.GA24731@mail.shareable.org>
 <20040826100530.GA20805@taniwha.stupidest.org>
 <20040826110258.GC30449@mail.shareable.org>
 <20040827210638.GE709@openzaurus.ucw.cz> <4133CDA6.4060105@slaphack.com>
 <20040831082144.GA535@elf.ucw.cz>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-fsdevel@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

>>>>> "Pavel" == Pavel Machek <pavel@ucw.cz> writes:

Pavel> Hi!
>> | uservfs does
>> |
>> | cd foo.deb#uar cd foo.deb/ar | vs.  | cd foo.deb#udeb cd
>> foo.deb/deb
>> 
>> and why would you want that, instead of just: cd foo.deb # for the ar
>> dpkg -i foo.deb # for the deb

Pavel> Because I want to see contents of that .deb package, nicely
Pavel> parsed?

What nicely-parsed information do you want to see?  A deb package is an
ar archive of three files:
- debian-binary, which contains the deb format version
- control.tar.gz, which contains the control data and related things
- data.tar.gz, which contains the actual files to be installed

So to get at the format version, you can "cat foo.deb/debian-binary".
To look at the control data, you can "ls foo.deb/control.tar.gz".  To
browse the files, "cd foo.deb/data.tar.gz".

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

