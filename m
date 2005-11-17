From: Hans Reiser <reiser@namesys.com>
Subject: Re: More Slowdown
Date: Wed, 16 Nov 2005 20:49:53 -0800
Message-ID: <437C0BF1.3080109@namesys.com>
References: <200511111359.39715.jgilmore@glycou.com>	 <200511120906.39109.jgilmore@glycou.com>	 <1131997263.10816.56.camel@teratron.lan.etheus.net>	 <200511142147.07787.chrivers@iversen-net.dk>	 <1132064829.8002.9.camel@teratron.lan.etheus.net> <b14e81f00511161908k30ed471esbc12b284842b8078@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26969-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <b14e81f00511161908k30ed471esbc12b284842b8078@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: michael chang <thenewme91@gmail.com>
Cc: Craig Shelley <craig@microtron.org.uk>, reiserfs-list@namesys.com

fsync can be dramatically better optimized, and it will be after the
kernel merge work is completed.  This optimization will likely consist
of reducing the tendency to merge atoms and handling fsync by using
write twice algorithms to a fixed journal area.  Other improvements will
doubtless be found when time is spent on it.  I am sorry that vim and
evolution are suffering so much from our neglecting fsync until after
the merge.  fsync is one of the things I would have us working on if I
had my choice of what we improved in reiser4 rather than other persons
making that choice for us at the moment.  Oh well, such is life in the
society of men.;-)

It looks like akpm is going to start reading the reiser4 code.  I
suspect his remarks will be a step above the ones made so far, he wrote
such nice readahead code.
