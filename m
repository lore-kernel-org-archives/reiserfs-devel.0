From: Spam <spam@tnonline.net>
Subject: Re: The argument for fs assistance in handling archives (was: silent semantic changes with reiser4)
Date: Mon, 6 Sep 2004 16:59:23 +0200
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <164628888.20040906165923@tnonline.net>
References: <20040826150202.GE5733@mail.shareable.org>
 <200408282314.i7SNErYv003270@localhost.localdomain>
 <20040901200806.GC31934@mail.shareable.org>
 <Pine.LNX.4.58.0409011311150.2295@ppc970.osdl.org>
 <1094118362.4847.23.camel@localhost.localdomain> <20040902203854.GA4801@janus>
 <200409022319.i82NJlTN025039@turing-police.cc.vt.edu>
 <1076230617.20040903014302@tnonline.net> <20040906144358.GC29886@thundrix.ch>
Reply-To: Spam <spam@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <20040906144358.GC29886@thundrix.ch>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tonnerre <tonnerre@thundrix.ch>
Cc: Valdis.Kletnieks@vt.edu, Frank van Maarseveen <frankvm@xs4all.nl>, Alan Cox <alan@lxorguk.ukuu.org.uk>, Linus Torvalds <torvalds@osdl.org>, Jamie Lokier <jamie@shareable.org>, Horst von Brand <vonbrand@inf.utfsm.cl>, Adrian Bunk <bunk@fs.tum.de>, Hans Reiser <reiser@namesys.com>, viro@parcelfarce.linux.theplanet.co.uk, Christoph Hellwig <hch@lst.de>, linux-fsdevel@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>


  

> Salut,

> On Fri, Sep 03, 2004 at 01:43:02AM +0200, Spam wrote:
>>   Yes why not? If there was any filesystem drivers for the AudioCD
>>   format then it could.
>> 
>>   I had such a driver for Windows 9x which would display several
>>   folders and files for inserted AudioCD's:
>> 
>>   D: (cdrom)
>>     Stereo
>>       22050
>>         Track01.wav
>>         Track02.wav
>>         ...
>>       44100
>>         Track01.wav
>>         ...
>>     Mono
>>       22050
>>         Track01.wav
>>         ...
>>       44100
>>         Track01.wav
>>         ...

> So you'd like the kernel to know  about raw CD PCM and RIFF PCM format
> and conversion? Great.. That's really Solarisish!

  If it could be done in userland, and still be accessible for most
  applications then that is great.

  If the user things that such a plugin is of value for him then I do
  not see why he should not be able to use it? Again these are example
  of stuff that could be done if there was a plugin/extensible
  interface.

  You make it sound like everything on the planet should be predefined
  and included in the kernel. This is not what I was saying or wanted.

  From what I understood from Hans, there will be a way to load
  plugins without having to recompile reiser4 module (or the kernel).
  This is what I'd like to see.

  Some things/plugins may even be partially user-space.

  ~S

  

> 			    Tonnerre


