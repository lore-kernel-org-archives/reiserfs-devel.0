From: "Jaroslav Fojtik" <JaFojtik@seznam.cz>
Subject: Re8: Reiserfs3 is crashing - where/whom to report?
Date: Tue, 20 Jan 2009 22:20:40 +0100
Message-ID: <49764028.21407.CBEC48@JaFojtik.seznam.cz>
References: <49750FC1.23700.2C929@JaFojtik.seznam.cz>, <49761CA5.613.41328D@JaFojtik.seznam.cz>, <49761DEE.2000204@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-reply-to: <49761DEE.2000204@gmail.com>
Content-description: Mail message body
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward.shishkin@gmail.com>, Jeff Mahoney <jeffm@suse.com>, Reiserfs mailing list <reiserfs-devel@vger.kernel.org>

Dear Edward,

> "HDD with blocksize" is a poor phrase. HDD has a property "sector size".
> Blocksize is a property of filesystem.
Sorry. I mean HDD with filesystem with blocksize.


> No, it doesn't, if you mean to reproduce a crash with reiserfs
> formatted by "mkreiserfs -b 1024": I know how to reproduce it.
Now it is clean.

  It was a very stupid thing to allow unstable stuff in reiserfs in public
without any warning and pretend that everything is OK.

  Jara

