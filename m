From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: the " 'official' point of view" expressed by kernelnewbies.org
 regarding reiser4 inclusion
Date: Tue, 1 Aug 2006 08:22:04 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0608010821300.10130@yvahk01.tjqt.qr>
References: <1153760245.5735.47.camel@ipso.snappymail.ca>
 <200607241806.k6OI6uWY006324@laptop13.inf.utfsm.cl>
 <20060731125846.aafa9c7c.reiser4@blinkenlights.ch> <20060731144736.GA1389@merlin.emma.line.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-29371-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060731144736.GA1389@merlin.emma.line.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthias Andree <matthias.andree@gmx.de>
Cc: Adrian Ulrich <reiser4@blinkenlights.ch>, "Horst H. von Brand" <vonbrand@inf.utfsm.cl>, ipso@snappymail.ca, reiser@namesys.com, lkml@lpbproductions.com, jeff@garzik.org, tytso@mit.edu, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

>
>> A filesystem with a fixed number of inodes (= not readjustable while
>> mounted) is ehr.. somewhat unuseable for a lot of people with
>> big and *flexible* storage needs (Talking about NetApp/EMC owners)
>
>Which is untrue at least for Solaris, which allows resizing a life file
>system. FreeBSD and


>Linux require an unmount.

Only for shrinking.


Jan Engelhardt
-- 
