From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: reiserfs 3 on top of software raid 1
Date: Tue, 28 Feb 2006 14:00:21 +0300
Message-ID: <1141124421.6207.139.camel@tribesman.namesys.com>
References: <20060228001451.bc74a3d1.petchema@concept-micro.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-28150-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060228001451.bc74a3d1.petchema@concept-micro.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Pierre =?ISO-8859-1?Q?Etchema=EFt=E9?= <petchema@concept-micro.com>
Cc: reiserfs-list@namesys.com

Hello

On Tue, 2006-02-28 at 00:14 +0100, Pierre Etchemaïté wrote:
> 	Hi all,
> 
> I have a question that didn't occur to me until a power failure (eh)...
> 
> When a journalized file system like reiserfs 3 runs on top on a
> software raid volume, does the volume give enough (and correct)
> feedback so that the file system can still guarantee that its metadata
> will be in a consistant state after a power failure/crash/you name it ?
> 
> If all disks go back online ? If some don't (but below redundancy
> amount, of course) ?
> 
> In short, beside disks resynching, is a fsck also necessary ?
> 

It should not be. I believe that journal replaying on mount is enough.
Does your experience contradict that?

