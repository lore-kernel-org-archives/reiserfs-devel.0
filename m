From: "John D. Heintz" <jheintz@pobox.com>
Subject: Re: Trying to understand keys in terms of objects, items, and units.
Date: Thu, 8 Mar 2007 13:08:38 -0600
Message-ID: <c82045430703081108y5024975ap46f107324612f763@mail.gmail.com>
References: <c82045430703051504t1c3dc813mffdc1aea3b8754c0@mail.gmail.com>
	 <45ED8EAE.4070300@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_121019_15932284.1173380918806"
Return-path: <reiserfs-list-return-30591-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:sender:to:subject:cc:in-reply-to:mime-version:content-type:references:x-google-sender-auth;
        b=IbaM8gmLJ1AIJFtLEVStDRpx/ad/sUTzdAfTopUE/CnJY9HuSNHjg0gXcpzzVmhrPr6+2u8j3KiyiGvQIOw3ax5rAkWkEmhx5Dc76GomfBKpx/1iTQxcy8Yh6N5cvMcPx3KUiasIUh46JpdRUBWZTCnOCeTS6CgBfylJLoYHhQY=
Sender: jheintz@gmail.com
In-Reply-To: <45ED8EAE.4070300@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward@namesys.com>
Cc: reiserfs-list@namesys.com

------=_Part_121019_15932284.1173380918806
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Thanks for the response Edward. It has definitely helped clarify things. I'm
going to try the  debugfs.reiser4 tool, and I've got a few more questions
below.

On 3/6/07, Edward Shishkin <edward@namesys.com> wrote:
>
> John D. Heintz wrote:
>
> > Hello all,
> >
> > Can someone help explain to me the relationship between keys and
> > objects/items/units? Specifically, I'm confused by the reality that a
> > single file (object?) is identified by one key,
>
>
> This reality is incorrect. Key is assigned for a storage unit.
> File is not a storage unit. Item is.
> On-disk file includes different items, even items of different type
> (for example, stat-data and extent pointers) which have different
> key. However appropriate components of those keys are coincide.


Here "coincide" means that major and minor locality may be the same?

> but the individual parts (stat_data, extends) each have their own keys
> > as well.
>
>
> Right.
> stat-data and extent pointer are items, and each item has a unique key.
>
> > How does one key lead to the others?
> >
> > Are there any detailed examples of keys available?
>
>
> Mount an empty reiser4 partition to /mnt, write a file
> echo "Hello World" > /mnt/foo && sync
> then investigate this partition by debugfs.reiser4 -t
> You will see various examples of items and keys.
> Note, that terminology can be different: NPTR
> (node pointer) means internal item. SD is stat-data
> item, DIRITEM is compound directory item, etc.
> Ask if something is unclear.


I plan on doing this shortly, thanks for the description. This is probably
exactly what I'm looking for.

> If the diagram from the whitepaper here:
> > http://www.namesys.com/treepics/treepicswin/Blobs_Reiser4.gif
> > <http://www.namesys.com/treepics/treepicswin/Blobs_Reiser4.gif> could
> > be annotated to contain samples for:
> >  * a single directory,
> >  * two small files,
> >  * a large file (2-3 extents)
> >  * the stat_data (and item keys)
> >  * twig nodes showing delimiting keys and extent pointers
> >  * formatted nodes showing directory entries, stat_data
> >  * also, plugin id at the unit, item, and object levels would help!
> >
> > I think that would be very helpful for people to understand how the
> > tree and plugins work.
>
>
> ok, I'll try to illustrate..
>
> >
> > I'm slogging through the code in my spare time, but I really hope
> > someone already knows the answers and will post an explanation!
> >
> > The following statements in the V4 whitepaper led me to realizing the
> > storage layer was doing something with keys I didn't understand:
> >
> >   "Everything in the tree has exactly one key."
>
>
> Yeah, a bit clumsy phrase.. It would be better: "every object is
> represented as a set of items, and every item has a unique key".


That makes much more sense.

>
> >   "These directory entries contain a name, and a key." (The Unix
> > Directory Plugin)
>
>
> Right.
> Like other objects, directory is represented as a set of items of
> special "compound directory item" type. Its format  is defined in
> reiser4/plugin/item/cde.h, see also comments at the beginning
> of reiser4/plugin/item/cde.c
> So every directory entry is represented on disk as a unit within
> compound directory item.
>
>
> >   "...more precisely, since a key selects not just the file but a
> > particular byte within a file,
>
>
> Right.
> For each file you can construct a unique key that will address a
> particular byte within this file.


What would that key look like? I can imagine a key for the "file content"
item. The bytes would be units inside that item, but how does that offset
fit within a key? Or is this what the coord struct is all about?

Actually, things in Reiser4 are more fine grained, and items are
> considered as a (fully ordered) set of smaller objects, so-called
> item's units, so every unit has its own key and item's key is coincide
> with the key of its first unit. This approach is convenient.
> For example, units can be used to address a particular bytes within
> a file built of tail items. It is more graceful way, then just having
> an item to access its content (which in common case can be quite
> complex) by some ugly macro (approach of reiserfs, v3)
>
> > it returns that part of the key which is sufficient to select the
> > file, and which is sufficient to allow the code to determine what the
> > full keys for those various parts when the byte offset and some other
> > fields (like item type) are added to the partial key to form a whole
> > key..."
> >
> >   "The key can then be used by the tree storage layer to find all the
> > pieces of that which was named."
>
>
> Reiser4 is a storage layer of global Reiser's project which
> aims to add support for semi-structured data querying to the
> file system namespace (more details about global project are
> in whitepaper.html)
>
> >
> >   "we can store just one key for the extent, and then we can calculate
> > the key of any byte within that extent."
>
>
> It means we don't keep a key for each unit. Key of each unit
> is calculated by its item key and unit's position in the item
> (special method ->unit_key() of item plugin stands for this).
> What should be kept in mind:
> 1) item is a "real" storage unit: its key is stored on disk.
> 2) item's unit is a "virtual" storage unit: its key is calculated.



From the comments in key.h, it seems like a key is 24 bytes long. Are these
virtual keys the same or different things? That is, what is different
between a key to the file item and a key to the 3rd byte in a file item?

>
> > Thanks,
> > John
> >
> > --
> > John D. Heintz
> > Principal Consultant
> > New Aspects of Software
> > Austin, TX
> > (512) 633-1198
>
>
>


-- 
John D. Heintz
Principal Consultant
New Aspects of Software
Austin, TX
(512) 633-1198

------=_Part_121019_15932284.1173380918806
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Thanks for the response Edward. It has definitely helped clarify things. I&#39;m going to try the&nbsp; debugfs.reiser4 tool, and I&#39;ve got a few more questions below.<br><br><div><span class="gmail_quote">On 3/6/07, <b class="gmail_sendername">
Edward Shishkin</b> &lt;<a href="mailto:edward@namesys.com">edward@namesys.com</a>&gt; wrote:</span><blockquote class="gmail_quote" style="border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">
John D. Heintz wrote:<br><br>&gt; Hello all,<br>&gt;<br>&gt; Can someone help explain to me the relationship between keys and<br>&gt; objects/items/units? Specifically, I&#39;m confused by the reality that a<br>&gt; single file (object?) is identified by one key,
<br><br><br>This reality is incorrect. Key is assigned for a storage unit.<br>File is not a storage unit. Item is.<br>On-disk file includes different items, even items of different type<br>(for example, stat-data and extent pointers) which have different
<br>key. However appropriate components of those keys are coincide.</blockquote><div><br>Here &quot;coincide&quot; means that major and minor locality may be the same? <br></div><br><blockquote class="gmail_quote" style="border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">
&gt; but the individual parts (stat_data, extends) each have their own keys<br>&gt; as well.<br><br><br>Right.<br>stat-data and extent pointer are items, and each item has a unique key.<br><br>&gt; How does one key lead to the others?
<br>&gt;<br>&gt; Are there any detailed examples of keys available?<br><br><br>Mount an empty reiser4 partition to /mnt, write a file<br>echo &quot;Hello World&quot; &gt; /mnt/foo &amp;&amp; sync<br>then investigate this partition by 
debugfs.reiser4 -t<br>You will see various examples of items and keys.<br>Note, that terminology can be different: NPTR<br>(node pointer) means internal item. SD is stat-data<br>item, DIRITEM is compound directory item, etc.
<br>Ask if something is unclear.</blockquote><div><br>I plan on doing this shortly, thanks for the description. This is probably exactly what I&#39;m looking for. <br></div><br><blockquote class="gmail_quote" style="border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">
&gt; If the diagram from the whitepaper here:<br>&gt; <a href="http://www.namesys.com/treepics/treepicswin/Blobs_Reiser4.gif">http://www.namesys.com/treepics/treepicswin/Blobs_Reiser4.gif</a><br>&gt; &lt;<a href="http://www.namesys.com/treepics/treepicswin/Blobs_Reiser4.gif">
http://www.namesys.com/treepics/treepicswin/Blobs_Reiser4.gif</a>&gt; could<br>&gt; be annotated to contain samples for:<br>&gt;&nbsp;&nbsp;* a single directory,<br>&gt;&nbsp;&nbsp;* two small files,<br>&gt;&nbsp;&nbsp;* a large file (2-3 extents)<br>
&gt;&nbsp;&nbsp;* the stat_data (and item keys)<br>&gt;&nbsp;&nbsp;* twig nodes showing delimiting keys and extent pointers<br>&gt;&nbsp;&nbsp;* formatted nodes showing directory entries, stat_data<br>&gt;&nbsp;&nbsp;* also, plugin id at the unit, item, and object levels would help!
<br>&gt;<br>&gt; I think that would be very helpful for people to understand how the<br>&gt; tree and plugins work.<br><br><br>ok, I&#39;ll try to illustrate..<br><br>&gt;<br>&gt; I&#39;m slogging through the code in my spare time, but I really hope
<br>&gt; someone already knows the answers and will post an explanation!<br>&gt;<br>&gt; The following statements in the V4 whitepaper led me to realizing the<br>&gt; storage layer was doing something with keys I didn&#39;t understand:
<br>&gt;<br>&gt;&nbsp;&nbsp; &quot;Everything in the tree has exactly one key.&quot;<br><br><br>Yeah, a bit clumsy phrase.. It would be better: &quot;every object is<br>represented as a set of items, and every item has a unique key&quot;.
</blockquote><div><br>That makes much more sense. <br></div><br><blockquote class="gmail_quote" style="border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">&gt;<br>&gt;&nbsp;&nbsp; &quot;These directory entries contain a name, and a key.&quot; (The Unix
<br>&gt; Directory Plugin)<br><br><br>Right.<br>Like other objects, directory is represented as a set of items of<br>special &quot;compound directory item&quot; type. Its format&nbsp;&nbsp;is defined in<br>reiser4/plugin/item/cde.h, see also comments at the beginning
<br>of reiser4/plugin/item/cde.c<br>So every directory entry is represented on disk as a unit within<br>compound directory item.<br><br><br>&gt;&nbsp;&nbsp; &quot;...more precisely, since a key selects not just the file but a<br>&gt; particular byte within a file,
<br><br><br>Right.<br>For each file you can construct a unique key that will address a<br>particular byte within this file.</blockquote><div><br>What would that key look like? I can imagine a key for the &quot;file content&quot; item. The bytes would be units inside that item, but how does that offset fit within a key? Or is this what the coord struct is all about?
<br></div><br><blockquote class="gmail_quote" style="border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">Actually, things in Reiser4 are more fine grained, and items are<br>considered as a (fully ordered) set of smaller objects, so-called
<br>item&#39;s units, so every unit has its own key and item&#39;s key is coincide<br>with the key of its first unit. This approach is convenient.<br>For example, units can be used to address a particular bytes within<br>
a file built of tail items. It is more graceful way, then just having<br>an item to access its content (which in common case can be quite<br>complex) by some ugly macro (approach of reiserfs, v3)<br><br>&gt; it returns that part of the key which is sufficient to select the
<br>&gt; file, and which is sufficient to allow the code to determine what the<br>&gt; full keys for those various parts when the byte offset and some other<br>&gt; fields (like item type) are added to the partial key to form a whole
<br>&gt; key...&quot;<br>&gt;<br>&gt;&nbsp;&nbsp; &quot;The key can then be used by the tree storage layer to find all the<br>&gt; pieces of that which was named.&quot;<br><br><br>Reiser4 is a storage layer of global Reiser&#39;s project which
<br>aims to add support for semi-structured data querying to the<br>file system namespace (more details about global project are<br>in whitepaper.html)<br><br>&gt;<br>&gt;&nbsp;&nbsp; &quot;we can store just one key for the extent, and then we can calculate
<br>&gt; the key of any byte within that extent.&quot;<br><br><br>It means we don&#39;t keep a key for each unit. Key of each unit<br>is calculated by its item key and unit&#39;s position in the item<br>(special method -&gt;unit_key() of item plugin stands for this).
<br>What should be kept in mind:<br>1) item is a &quot;real&quot; storage unit: its key is stored on disk.<br>2) item&#39;s unit is a &quot;virtual&quot; storage unit: its key is calculated.</blockquote><div><br><br>
From the comments in key.h, it seems like a key is 24 bytes long. Are these virtual keys the same or different things? That is, what is different between a key to the file item and a key to the 3rd byte in a file item?<br>
</div><br><blockquote class="gmail_quote" style="border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">&gt;<br>&gt; Thanks,<br>&gt; John<br>&gt;<br>&gt; --<br>&gt; John D. Heintz<br>&gt; Principal Consultant
<br>&gt; New Aspects of Software<br>&gt; Austin, TX<br>&gt; (512) 633-1198<br><br><br></blockquote></div><br><br clear="all"><br>-- <br>John D. Heintz<br>Principal Consultant<br>New Aspects of Software<br>Austin, TX<br>(512) 633-1198

------=_Part_121019_15932284.1173380918806--
