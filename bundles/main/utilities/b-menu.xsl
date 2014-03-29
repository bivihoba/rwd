<xsl:stylesheet version="1.0"
				xmlns="http://www.w3.org/1999/xhtml"
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:a="http://slcf/templates/settings/bem-scheme/additional"
				xmlns:b="http://slcf/templates/settings/bem-scheme/block"
				xmlns:d="http://slcf/templates/settings/bem-scheme/data"
				xmlns:e="http://slcf/templates/settings/bem-scheme/element"
				xmlns:m="http://slcf/templates/settings/bem-scheme/modification"
				xmlns:p="http://slcf/templates/settings/bem-scheme/pointer"
				xmlns:t="http://slcf/templates/settings/bem-scheme/template"
				xmlns:x="http://slcf/templates/settings/bem-scheme/xhtml"
				xmlns:alxc="http://slcf/templates/settings/bem-scheme/additional-legacy-xhtml-class"
				xmlns:exsl="http://exslt.org/common"
				exclude-result-prefixes="a b e x d p m t alxc"
				extension-element-prefixes="exsl">

		<xsl:template match="menu_content_main" mode="data" xml:space="preserve">
			<b:menu>
				<m:content val="main"/>
				<xsl:apply-templates select="list" mode="data_menu__list"/>
			</b:menu>
		</xsl:template>

		<xsl:template match="*" mode="data_menu__list" xml:space="preserve"/>
		<xsl:template match="list" mode="data_menu__list" xml:space="preserve">
			<e:list>
				<xsl:apply-templates select="." mode="data_menu__list-content-type"/>
				<xsl:apply-templates select="item" mode="data_menu__item"/>
			</e:list>
		</xsl:template>

		<xsl:template match="*" mode="data_menu__list-content-type" xml:space="preserve"/>
		<xsl:template match="list[@content]" mode="data_menu__list-content-type" xml:space="preserve">
			<m:content val="{@content}"/>
		</xsl:template>

		<xsl:template match="*" mode="data_menu__item-content-type" xml:space="preserve"/>
		<xsl:template match="item[@content]" mode="data_menu__item-content-type" xml:space="preserve">
			<m:content val="{@content}"/>
		</xsl:template>

		<xsl:template match="*" mode="data_menu__item" xml:space="preserve"/>
		<xsl:template match="item" mode="data_menu__item" xml:space="preserve">
			<e:item>
				<xsl:apply-templates select="." mode="data_menu__item-content-type"/>
				<xsl:apply-templates select="." mode="data_menu__item_state"/>
				<e:item-text>
					<xsl:apply-templates select="." mode="data_menu__item-url"/>
					<xsl:apply-templates select="." mode="data_menu__item-title"/>
					<xsl:apply-templates select="." mode="data_menu__item-text"/>
				</e:item-text>
				<xsl:apply-templates select="." mode="data_menu__list-level"/>
			</e:item>
		</xsl:template>

		<xsl:template match="*" mode="data_menu__list-level" xml:space="preserve"/>
		<xsl:template match="item[list]" mode="data_menu__list-level" xml:space="preserve">
			<e:list>
				<m:level val="{count(ancestor-or-self::item) + 1}"/>
				<xsl:apply-templates select="list/item" mode="data_menu__item"/>
			</e:list>
		</xsl:template>

		<xsl:template match="*" mode="data_menu__item-url" xml:space="preserve"/>
		<xsl:template match="item[@url]" mode="data_menu__item-url" xml:space="preserve">
			<!--<a:link x:href="{@url}"/>-->
			<a:link x:href="{@url}">
				<xsl:apply-templates select="." mode="data_menu__check-url-type"/>
			</a:link>
		</xsl:template>

		<xsl:template match="*" mode="data_menu__check-url-type" xml:space="preserve"/>
		<xsl:template match="item[@type = 'external']" mode="data_menu__check-url-type" xml:space="preserve">
			<m:resource val="external"/>
		</xsl:template>

		<xsl:template match="item[@handle = //title/@handle]" mode="data_menu__item-url" xml:space="preserve"/>

		<xsl:template match="*" mode="data_menu__item_state" xml:space="preserve"/>

		<xsl:template match="item[descendant::item[@handle = //title/@handle]]" mode="data_menu__item_state" xml:space="preserve">
			<m:state val="expanded"/>
		</xsl:template>

		<xsl:template match="item[@handle = //title/@handle]" mode="data_menu__item_state" xml:space="preserve">
			<m:state val="selected"/>
		</xsl:template>

		<xsl:template match="*" mode="data_menu__item-title" xml:space="preserve"/>
		<xsl:template match="item[@title]" mode="data_menu__item-title" xml:space="preserve">
			<a:params noblock="true" x:title="{item/@title}"/>
		</xsl:template>

		<xsl:template match="*" mode="data_menu__item-text" xml:space="preserve">
			<xsl:value-of select="text()"/>
		</xsl:template>

</xsl:stylesheet>