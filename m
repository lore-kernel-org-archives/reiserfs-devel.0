From: Andrew Clausen <clausen@gnu.org>
Subject: Re: EVMS Reiser FSIM
Date: Sat, 1 Jun 2002 11:35:10 +1000
Message-ID: <20020601013509.GA1148@gnu.org>
References: <OF9CB2A45A.30F7F73A-ON85256BCA.005DD6AD@pok.ibm.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10477-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <OF9CB2A45A.30F7F73A-ON85256BCA.005DD6AD@pok.ibm.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve Pratt <slpratt@us.ibm.com>
Cc: Yury Umanets <umka@namesys.com>, reiserfs-list <reiserfs-list@namesys.com>

On Fri, May 31, 2002 at 12:40:19PM -0500, Steve Pratt wrote:
> I agree that system architecture should be the driving force.  That said,
> how I or anyone else codes a particular FSIM does not mean that someone
> else can't write one differently (read still using fork/exec) and get
> around the GPL.

FSF legal advice disagrees.  I imagine there would be courts that
rule both ways.

> 1.portable to what?

Vanilla Linux for a start!  Or Hurd, Windows, whatever...

> 2. No, not a result of 1.  A result of we didn't like the code. (and
> apparently neither did the LVM guys since they re-wrote it as well in
> LVM2).

Fair enough, but if LVM2 was coming, why not use that?

> We did re-use the bulk of MD so it is not that we couldn't have.

Ah, cool :)  However, you forked the code in the process.  Don't
you want the MD community to maintain it?

> Coupling is not always a bad thing.  It allows us to offer greater
> functionality to the user.  fisk, lvm and MD all have the ability to
> destroy each others data without knowing it because that are not coupled.
> In EVMS we can prevent these types of interaction problems.

Agreed.  But you want to make coupling as weak as possible... and I
think it's possible to have very weak coupling.

> 3. Yes, it is complicated, that is why no one has attempted this before.

Well, libparted is a "first-attempt".  (Also, what you were doing
in OS/2).

> As for sharing of code, you obviously haven't looked at any of it.  Just
> because an FSIM and a Segment manager have a entry point with a similar
> name, doesn't mean they do the same thing.  I challenge you to go into an
> FSIM and find code that is duplicated in any non-FSIM plugin.  FSIMs do
> filesystems, other plugins do volumes, not the same thing.  Why does parted
> have ped_device_open and ped_file_system_open? Why not 1 API, they both do
> open, must be duplication of code.

ped_device_open() and ped_file_system_open() are different.
One is opening a volume, the other opening a user of volume(s).
However, I think ped_disk_open() (disk means "partition table") and
ped_file_system_open() should be 1 API function.  ped_consumer_open(), or
something.

BTW: you wouldn't expect code-inside-an-FSIM to be duplicated in
a non-FSIM plugin.  I'm talking about FSIM-infrastructure and plugin
infrastructure code, and high-level code that calls that.  (Eg: UIs)

I get a headache looking at it, because you do things like:

int evms_can_shrink(object_handle_t thing) {
	...
	translate_handle(thing, &object, &type);
	...
	switch (type) {
		case DISK:
		case SEGMENT:
		case REGION:
		case EVMS_OBJECT:
			...

		case VOLUME:
			...

		default:
			...
	}
}

Like, you are sharing a single entry point with lots of different
types of objects... like, why is a volume different to a segment,
but a segment is the same as a disk?  Why is there a switch at all?
Why do you need translate_handle()?

> >Well, I think the above are major changes, and useful to make.
> >That said, 'major' doesn't mean time-consuming.  It just means
> >lots of change.  (But, in my experience, just lots of cut&paste)
> 
> Other than having FSIMs use libraries, I'm not sure what changes you are
> refering to.

See above.  (And in several other emails)

Cheers,
Andrew

