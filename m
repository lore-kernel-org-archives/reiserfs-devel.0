From: Hans Reiser <reiser@namesys.com>
Subject: Re: ReiserFS v3 choking when free space falls below 10%?
Date: Fri, 07 Jul 2006 14:20:28 -0700
Message-ID: <44AED01C.60601@namesys.com>
References: <44A55271.7050501@namesys.com> <44A55591.6060500@suse.com>	 <1152059846.30139.11.camel@ipso.snappymail.ca>	 <44AB25EE.8030702@namesys.com>	 <20060706125856.fdac1d16.pegasus@nerv.eu.org>	 <1152200638.30139.45.camel@ipso.snappymail.ca> <44AD5020.6050803@suse.com>	 <1152210439.30139.59.camel@ipso.snappymail.ca> <44AD58D1.9040806@suse.com>	 <1152257397.13211.43.camel@ipso.snappymail.ca>	 <20060707174935.GB13606@atrey.karlin.mff.cuni.cz> <1152306272.13211.62.camel@ipso.snappymail.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28941-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1152306272.13211.62.camel@ipso.snappymail.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mike Benoit <ipso@snappymail.ca>
Cc: Jan Kara <jack@suse.cz>, Jeff Mahoney <jeffm@suse.com>, =?UTF-8?B?SnVyZSBQZcSNYXI=?= <pegasus@nerv.eu.org>, reiserfs-list@namesys.com

Guys, if you run the kernel under a debugger, and get it to where you
see the excessive CPU usage, and then start stepping through the bitmap
code, I am sure it will be very obvious what the error is.  Can anyone
do that for us?  Jeff?
