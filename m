From: Whit Blauvelt <whit@transpect.com>
Subject: Please /dev/null html-only mail rather than sending it out on this list
Date: Sun, 18 Apr 2004 17:26:59 -0400
Message-ID: <20040418212659.GA5506@free.transpect.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-18034-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hi,

That a lot of spam has been coming through this list is one thing. That the
list daemon threatens to cut people from the list whose systems refuse to
accept some of the spam is another.

Might I suggest a simple category of stuff to throw out before forwarding to
the list: HTML-only mail. 99%+ of it is spam, and the other <1% isn't the
sort of people who have any interest in advanced file systems.

Two easy ways to block a lot of it: 

1. With procmail:

# HTML only message are most probably spam.
:0
* ^Content-Type:.*text/html
{      
  LOG="(HTML) "
  :0
  /dev/null
}

2. With SpamAssassin by setting the score for MIME_HTML_ONLY high and then
either /dev/null'ing or refusing to even accept such mail (providing you're
running it as a milter). (Which is what I do and why the listserv is getting
impatient with me.)

Other mail filtering methods will have equally easy ways to just toss this
trash where it belongs.

Whit
