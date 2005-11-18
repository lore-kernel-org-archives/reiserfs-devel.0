From: Hans Reiser <reiser@namesys.com>
Subject: Re: More Slowdown
Date: Fri, 18 Nov 2005 12:45:13 -0800
Message-ID: <437E3D59.4020201@namesys.com>
References: <200511111359.39715.jgilmore@glycou.com>	 <200511120906.39109.jgilmore@glycou.com>	 <1131997263.10816.56.camel@teratron.lan.etheus.net>	 <200511142147.07787.chrivers@iversen-net.dk>	 <1132064829.8002.9.camel@teratron.lan.etheus.net> <b14e81f00511161908k30ed471esbc12b284842b8078@mail.gmail.com> <437C0BF1.3080109@namesys.com> <437C715A.206@ursynow.2a.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27017-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <437C715A.206@ursynow.2a.pl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: =?ISO-8859-1?Q?Artur_Mak=F3wka?= <juice@ursynow.2a.pl>
Cc: michael chang <thenewme91@gmail.com>, Craig Shelley <craig@microtron.org.uk>, reiserfs-list@namesys.com

I would like to thank the users for doing so much to help us isolate
this bug.

Vladimir, it seems pretty clear that the problem is due to a code
change, not due to a lack of a feature.  Please isolate it to the
responsible code change, and fix the code change, before adding any
other code changes to speed things up.
