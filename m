From: Grant Miner <mine0057@mrs.umn.edu>
Subject: Re: [PATCH] "metas" in reiserfs v4 snapshot 2004.03.26
Date: Sat, 03 Apr 2004 23:00:45 -0600
Message-ID: <406F967D.4010207@mrs.umn.edu>
References: <20040404032233.86328.qmail@web25010.mail.ukl.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17687-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040404032233.86328.qmail@web25010.mail.ukl.yahoo.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com


>I do not disagree that it is unlikely.  However, it is
>still possible, so my question remains: what happens
>in the scenario I describe?
>
>  
>
Hi
What happens now is open() returns EEXIST (file exists) error; reiser4 
can't make the file.  Is this what you mean?
