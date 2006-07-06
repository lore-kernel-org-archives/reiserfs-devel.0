From: Hans Reiser <reiser@namesys.com>
Subject: Re: ReiserFS v3 choking when free space falls below 10%?
Date: Thu, 06 Jul 2006 12:17:56 -0700
Message-ID: <44AD61E4.2080201@namesys.com>
References: <1151602916.32453.40.camel@ipso.snappymail.ca>	 <1151608355.6335.79.camel@tribesman.namesys.com>	 <1151612146.11510.4.camel@ipso.snappymail.ca>	 <44A55271.7050501@namesys.com> <44A55591.6060500@suse.com>	 <1152059846.30139.11.camel@ipso.snappymail.ca>	 <44AB25EE.8030702@namesys.com>	 <20060706125856.fdac1d16.pegasus@nerv.eu.org>	 <1152200638.30139.45.camel@ipso.snappymail.ca> <44AD5020.6050803@suse.com>	 <44AD5287.4090208@namesys.com>  <44AD5430.1090701@suse.com> <1152211635.30139.72.camel@ipso.snappymail.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28926-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1152211635.30139.72.camel@ipso.snappymail.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Mahoney <jeffm@suse.com>
Cc: Mike Benoit <ipso@snappymail.ca>, =?UTF-8?B?SnVyZSBQZcSNYXI=?= <pegasus@nerv.eu.org>, reiserfs-list@namesys.com

Jeff, I am suspicious, because I know that 90% is a magic number in your
code.
