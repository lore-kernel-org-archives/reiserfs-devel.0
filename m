From: Jeffrey Yasskin <jyasskin@mail.utexas.edu>
Subject: Typos, etc in http://namesys.com/v4/v4.html
Date: Thu, 21 Aug 2003 21:16:33 -0500
Message-ID: <3F457D01.9080506@mail.utexas.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15385-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

I've found some typos and bugs in your Reiser4 page. I have tried to 
keep the comments in page order and label them by the heading they are 
contained in.

--Jeffrey


In the first sentence in the Items, the "them"at the end is ambiguous 
and should be replaced with "the objects" (or reworded).

I think the reference to bodies and body items in the Items:Units 
section should be about tails since they're tail items in the source. 
Actually, it looks like both the Types of Items and Units sections just 
need to be updated.

"Height Balancing versus Space Balancing" should just be "Height 
Balancing" since it never mentions space balancing.

In several places you say you don't compress keys or tail items, but I 
think you do. (ctails and lcomp nodes)

The titles of both cache design principles are slightly confusing. IMHO, 
"Reiser's Untie The Uncorrelated Principle of Cache Design" should be 
"Reiser's Untie-The-Uncorrelated Principle of Cache Design" (note the 
hyphens to connect the principle's name), and the other should be 
renamed similarly.

In "Reiser's Maximize The Variance Principle of Cache Design", you talk 
about temperatures before you define them, and the definition is hidden 
in parentheses.

In the "BLOBs Unbalance the Tree..." section: I think the "(Never accept 
that "..." argument...)" comment refers to an older version of this 
page, but first-time readers will just be confused. It should be 
explained or excised.
"Gray and Reuter say the criterion...": I think it's a goal, not a 
criterion. Or maybe the "criterion for fast searching of..."

The picture under "Procrastination..." should be above it.

The Repacker section says that V4.1 will modify the repacker to add air 
holes while in other places you say the repacker won't even be written 
till 4.1.

In the Link Taxonomy section significantly farther down the page, I 
think the names of the link types should use hyphens (count-links 
instead of countlinks) because in other parts of the file you string 4 
prefixes together with hyphens. (which is somewhat confusing but 
probably necessary)

