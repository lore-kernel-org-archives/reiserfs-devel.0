From: Chris Dukes <pakrat@www.uk.linux.org>
Subject: Re: online fsck
Date: Thu, 22 Apr 2004 18:11:00 +0100
Sender: <pakrat@www.linux.org.uk>
Message-ID: <20040422171100.GP25281@parcelfarce.linux.theplanet.co.uk>
References: <20040422150042.5b49c6c3.pegasus@nerv.eu.org> <1082640853.12989.54.camel@watt.suse.com> <20040422162402.0b2f3dd6.pegasus@nerv.eu.org> <20040422152409.GO25281@parcelfarce.linux.theplanet.co.uk> <16519.59524.529494.545461@laputa.namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-18157-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <16519.59524.529494.545461@laputa.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nikita Danilov <Nikita@Namesys.COM>
Cc: Jure Pe??ar <pegasus@nerv.eu.org>, reiserfs-list@namesys.com

On Thu, Apr 22, 2004 at 07:45:08PM +0400, Nikita Danilov wrote:
> Chris Dukes writes:
>  > 
>  > It is worth mentioning that FreeBSD supposedly has an online in the 
>  > background fsck for UFS2.
> 
> Wait a second. Assuming that kernel code has no bugs, the only
> corruption that may happen when soft-updates are used is leaked disk
> space. As I understand it, FreeBSD's background fsck fixes this problem
> and only it.

Reading through
http://www.shiningsilence.com/dbsdlog/archives/000212.html
That would appear to be the case.
And current experience indicates that UFS2 does not recover gracefully
when used on a disk that has been in service beyond its life expectancy.
> 
> But, under the same assumption, journalled file system needs _no_ fsck
> at all.

In this age of hot plugging, rough environments, drives that have
write caching turned on no matter how hard folks try to turn it off,
petabytes of spinning storage, and the continuing misunderstanding of 
MTBF, that is becoming an increasingly poor assumption.
Measures to verify that the metadata are sane without making all
of the data unavailable are needed.

Oh well back to fighting X for a project where things don't die
when some important metadata is corrupted, they just cough and sputter
a bit before continuing.
-- 
Chris Dukes
Been there, done that, got the slightly-charred t-shirt. -- Crowder
