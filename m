From: Clay Barnes <clay.barnes@gmail.com>
Subject: Re: another semantic storage system (in userspace)
Date: Thu, 13 Jul 2006 10:06:26 -0700
Message-ID: <20060713170626.GE31144@HAL_5000D.tc.ph.cox.net>
References: <87veq233dm.fsf@evinrude.uhoreg.ca>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-28989-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <87veq233dm.fsf@evinrude.uhoreg.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

I have been thinking lately that though we certainly need to do 
cleanup of the various bugs and such relating to the storage layer,
perhaps now is a good time to review and discuss the plans for the
semantic layer so that any outstanding concerns can be thouroughly
discussed and resolved before we get close to time to start with actual
work on that portion of Reiser4.  Remember, we have a real chance at
being the first semantic storage system with a significant user base,
and that places a terrible pressure for perfection on us (and I use 'us'
loosely, since I don't have nearly the code skills in C needed to dare
touch source in non-trivial ways---I hope however that between my CS and
Linguistics degrees, I'll be able to at least contribute some ideas).
If we're first out of the gate, but we have some significant flaw in
design, we're deeply endangered.  People will wait for our correction of
it (which may be impossible if it's a fundamental or debated problem),
or for another system that has less critical flaws.

These are my cricial concerns.  I know some of these have been addressed
before, but this keeps anything from being skipped under the assumption
that they've already been resolved.
1) Scope
  a) Should the semantic content of files be purely user-defined?
  b) Should the full extricable content of a file be read into semantic
  space?
  c) If so, should there be a seperation of the two forms of content?
  d) How would we address the two in a simple, user-transparent way?
2) Storage
  a) How do we store the semantic data so it is very rapidly accessable
  and easy to update, especially if we decide to use the full textual
  contentent of parsabe file?
3) Changes
  a) Should we instantly index at full capacity changes, or should we
  queue files needing re-indexing for a very low resource daemon to
  process?
  b) If we use the latter, how do we avoid disagreement between newly
  changed/created files and the semanic actions regarding them while the
  daemon works?
  c) If we use the former, how do we mimize the impact of this sudden
  spike in resources to the user without risking letting the index and
  data get out of sync.
4) Portability
  a) Should we provide a way to export semantic data when archiving to
  formats which standards prevent from using Reiser4 (such as DVD)?
  b) How do we handle exports from a partial filesystem, if we decide to
  provide export capabilities?
  c) Should we provide the ability to import from compeating semantic
  systems?  Export?
5) Code revisions
  a) With emerging formats, updates to formats and the numerous ways
  file standard change, how do we provide easy addition and updates to
  the filters we use to index files?
  b) Should we provide a simple user-editable means to change/augment
  filters?
  c) Can these both be resolved by placing the actual filters in
  userspace/filesystemspace instead of into the code?

I hope I haven't overstepped my relevance, and my apologies if I have,
but I just wanted to raise some concerns while they are easy to
address---before the code is started.

Further disclaimer:  I'm at work, so I may have been a little hasty
writing this (though technically, I'm *supposed* to be reasearching
semantic storage systems for our documents, so I'm not really goofing
off), so there may be errors from my minimal review/revision.

Thanks,
Clay

