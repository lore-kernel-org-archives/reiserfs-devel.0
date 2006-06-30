From: Hans Reiser <reiser@namesys.com>
Subject: Re: ReiserFS v3 choking when free space falls below 10%?
Date: Fri, 30 Jun 2006 11:18:32 -0700
Message-ID: <44A56AF8.6050508@namesys.com>
References: <1151602916.32453.40.camel@ipso.snappymail.ca>	 <1151608355.6335.79.camel@tribesman.namesys.com>	 <1151612146.11510.4.camel@ipso.snappymail.ca>	 <44A55271.7050501@namesys.com> <44A55591.6060500@suse.com>	 <44A5598E.9060502@namesys.com> <1151689588.5927.18.camel@ipso.snappymail.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28882-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1151689588.5927.18.camel@ipso.snappymail.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mike Benoit <ipso@snappymail.ca>
Cc: Jeff Mahoney <jeffm@suse.com>, "Vladimir V. Saveliev" <vs@namesys.com>, reiserfs-list@namesys.com

Jeff, does the code do anything funny when crossing the 90% point?  You
have special heuristics for that, yes?  Maybe a bug is hiding in them?
