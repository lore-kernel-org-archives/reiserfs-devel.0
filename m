From: Oleg Drokin <green@namesys.com>
Subject: Re: Problem: lost first 5% of the harddisk
Date: Tue, 6 Aug 2002 09:08:35 +0400
Message-ID: <20020806090835.A18078@namesys.com>
References: <CEEMLMOIDLIGGEOFGCDOCEAOCAAA.michaelbh@gmx.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11130-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <CEEMLMOIDLIGGEOFGCDOCEAOCAAA.michaelbh@gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Huber <michaelbh@gmx.net>
Cc: reiserfs-list@namesys.com

Hello!

On Mon, Aug 05, 2002 at 08:15:35PM +0200, Michael Huber wrote:

> while i changed my harddisk to another IDE-controller i lost
> the first 2 gb of them and all partition and file system information too. 
> the first 5 % where "initialized" with zeroes and could not be recovered.
> is there any possibility to get out the filestructure from the remaining 
> harddisk (about 10gb). harddisksize = 40gb 

User errors and hardware problems are dealt with based on
http://www.namesys.com/support.html terms.

> the format used was reiserfs format version 3.5 with hash function r5

Actually since reiserfs usually stores metadata at the beginning of the disk,
the chances of recovering all of the info are very low.
Most probably all of the metadata is gone and without the metadata it is
kind of hard to restore real data.

Bye,
    Oleg
