From: Mathieu Segaud <Mathieu.Segaud@crans.org>
Subject: Re: 2.6.11-rc5-mm1
Date: Tue, 01 Mar 2005 15:00:59 +0100
Message-ID: <87wtsrwjms.fsf@barad-dur.crans.org>
References: <20050301012741.1d791cd2.akpm@osdl.org>
	<871xazxyke.fsf@barad-dur.crans.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-=-="
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <871xazxyke.fsf@barad-dur.crans.org> (Mathieu Segaud's message of
	"Tue, 01 Mar 2005 14:53:05 +0100")
List-Id: <reiserfs-devel.vger.kernel.org>
To: Mathieu Segaud <Mathieu.Segaud@crans.org>
Cc: Andrew Morton <akpm@osdl.org>, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Mathieu Segaud <Mathieu.Segaud@crans.org> disait derni=C3=A8rement que :

Hum, one hunk didn't make it.
The complete patch is attached

>
> fs/reiser4/plugin/item/ctail.c: In function `check_ctail':
> fs/reiser4/plugin/item/ctail.c:250: attention : l'adresse de =C3=82=C2=AB=
 ctail_ok =C3=82=C2=BB sera toujours =C3=83=C2=A9valu=C3=83=C2=A9e comme =
=C3=83=C2=A9tant =C3=82=C2=AB true =C3=82=C2=BB
> fs/reiser4/plugin/item/ctail.c: In function `convert_ctail':
> fs/reiser4/plugin/item/ctail.c:1669: attention : l'adresse de =C3=82=C2=
=AB coord_is_unprepped_ctail =C3=82=C2=BB sera toujours =C3=83=C2=A9valu=C3=
=83=C2=A9e comme =C3=83=C2=A9tant =C3=82=C2=AB true =C3=82=C2=BB
>

Signed-off-by: Mathieu Segaud <mathieu.segaud@crans.org>


--=-=-=
Content-Type: text/x-patch
Content-Disposition: inline; filename=fix-reiser4-build.patch

--- fs/reiser4/plugin/item/ctail.c	2005-03-01 14:57:52.756014040 +0100
+++ fs/reiser4/plugin/item/ctail.c.new	2005-03-01 14:57:19.791025480 +0100
@@ -247,7 +247,7 @@
 reiser4_internal int
 check_ctail (const coord_t * coord, const char **error)
 {
-	if (!ctail_ok) {
+	if (!ctail_ok(coord)) {
 		if (error)
 			*error = "bad cluster shift in ctail";
 		return 1;
@@ -1666,7 +1666,7 @@
 		detach_convert_idata(pos->sq);
 		break;
 	case CRC_OVERWRITE_ITEM:
-		if (coord_is_unprepped_ctail) {
+		if (coord_is_unprepped_ctail(&pos->coord)) {
 			/* convert unpprepped ctail to prepped one */
 			int shift;
 			shift = inode_cluster_shift(item_convert_data(pos)->inode);




-- 
Outlook, n.:
        A virus delivery system with added email functionality.

	- Kurt Wall on linux-kernel

--=-=-=--
