--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2
-- Dumped by pg_dump version 17.0

-- Started on 2025-07-19 14:10:56

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 321 (class 1259 OID 31955)
-- Name: apertura_caja; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.apertura_caja (
    id integer NOT NULL,
    sesion_id integer,
    monto_inicial numeric(12,2)
);


ALTER TABLE public.apertura_caja OWNER TO postgres;

--
-- TOC entry 320 (class 1259 OID 31954)
-- Name: apertura_caja_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.apertura_caja_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.apertura_caja_id_seq OWNER TO postgres;

--
-- TOC entry 5596 (class 0 OID 0)
-- Dependencies: 320
-- Name: apertura_caja_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.apertura_caja_id_seq OWNED BY public.apertura_caja.id;


--
-- TOC entry 327 (class 1259 OID 32001)
-- Name: arqueo_caja; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.arqueo_caja (
    id integer NOT NULL,
    sesion_id integer,
    fecha timestamp without time zone,
    observaciones text,
    monto_final numeric(12,2),
    monto_real_efectivo numeric(12,2),
    diferencia numeric(12,2)
);


ALTER TABLE public.arqueo_caja OWNER TO postgres;

--
-- TOC entry 326 (class 1259 OID 32000)
-- Name: arqueo_caja_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.arqueo_caja_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.arqueo_caja_id_seq OWNER TO postgres;

--
-- TOC entry 5597 (class 0 OID 0)
-- Dependencies: 326
-- Name: arqueo_caja_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.arqueo_caja_id_seq OWNED BY public.arqueo_caja.id;


--
-- TOC entry 331 (class 1259 OID 32039)
-- Name: auditoria_movimientos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auditoria_movimientos (
    id integer NOT NULL,
    usuario_id integer,
    fecha timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    tabla_afectada character varying(100),
    operacion character varying(20),
    descripcion text
);


ALTER TABLE public.auditoria_movimientos OWNER TO postgres;

--
-- TOC entry 330 (class 1259 OID 32038)
-- Name: auditoria_movimientos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auditoria_movimientos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auditoria_movimientos_id_seq OWNER TO postgres;

--
-- TOC entry 5598 (class 0 OID 0)
-- Dependencies: 330
-- Name: auditoria_movimientos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auditoria_movimientos_id_seq OWNED BY public.auditoria_movimientos.id;


--
-- TOC entry 241 (class 1259 OID 31229)
-- Name: bancos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bancos (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL
);


ALTER TABLE public.bancos OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 31228)
-- Name: bancos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bancos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.bancos_id_seq OWNER TO postgres;

--
-- TOC entry 5599 (class 0 OID 0)
-- Dependencies: 240
-- Name: bancos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bancos_id_seq OWNED BY public.bancos.id;


--
-- TOC entry 317 (class 1259 OID 31924)
-- Name: cajas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cajas (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    descripcion text,
    sucursal_id integer
);


ALTER TABLE public.cajas OWNER TO postgres;

--
-- TOC entry 316 (class 1259 OID 31923)
-- Name: cajas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cajas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cajas_id_seq OWNER TO postgres;

--
-- TOC entry 5600 (class 0 OID 0)
-- Dependencies: 316
-- Name: cajas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cajas_id_seq OWNED BY public.cajas.id;


--
-- TOC entry 341 (class 1259 OID 33535)
-- Name: categorias_productos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categorias_productos (
    id bigint NOT NULL,
    nombre character varying(255) NOT NULL
);


ALTER TABLE public.categorias_productos OWNER TO postgres;

--
-- TOC entry 340 (class 1259 OID 33534)
-- Name: categorias_productos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.categorias_productos ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.categorias_productos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 323 (class 1259 OID 31967)
-- Name: cierre_caja; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cierre_caja (
    id integer NOT NULL,
    sesion_id integer,
    fecha_cierre timestamp without time zone,
    total_efectivo numeric(12,2),
    total_tarjeta numeric(12,2),
    total_transferencia numeric(12,2),
    total_qr numeric(12,2),
    total_vuelto numeric(12,2),
    monto_cierre numeric(12,2)
);


ALTER TABLE public.cierre_caja OWNER TO postgres;

--
-- TOC entry 322 (class 1259 OID 31966)
-- Name: cierre_caja_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cierre_caja_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cierre_caja_id_seq OWNER TO postgres;

--
-- TOC entry 5601 (class 0 OID 0)
-- Dependencies: 322
-- Name: cierre_caja_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cierre_caja_id_seq OWNED BY public.cierre_caja.id;


--
-- TOC entry 343 (class 1259 OID 33541)
-- Name: clientes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clientes (
    id bigint NOT NULL,
    direccion character varying(255),
    email character varying(255),
    nombre character varying(255),
    ruc character varying(255),
    telefono character varying(255)
);


ALTER TABLE public.clientes OWNER TO postgres;

--
-- TOC entry 342 (class 1259 OID 33540)
-- Name: clientes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.clientes ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.clientes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 311 (class 1259 OID 31873)
-- Name: cobros; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cobros (
    id integer NOT NULL,
    venta_id integer,
    fecha date,
    total_cobrado numeric(12,2),
    servicio_id integer,
    usuario_id integer
);


ALTER TABLE public.cobros OWNER TO postgres;

--
-- TOC entry 310 (class 1259 OID 31872)
-- Name: cobros_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cobros_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cobros_id_seq OWNER TO postgres;

--
-- TOC entry 5602 (class 0 OID 0)
-- Dependencies: 310
-- Name: cobros_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cobros_id_seq OWNED BY public.cobros.id;


--
-- TOC entry 255 (class 1259 OID 31398)
-- Name: compras; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.compras (
    id integer NOT NULL,
    proveedor_id integer,
    fecha_compra date,
    numero_factura character varying(50),
    tipo_documento_id integer,
    condicion_pago character varying(50),
    total numeric(12,2),
    estado character varying(50),
    orden_compra_id integer,
    usuario_id integer
);


ALTER TABLE public.compras OWNER TO postgres;

--
-- TOC entry 257 (class 1259 OID 31415)
-- Name: compras_detalles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.compras_detalles (
    id integer NOT NULL,
    compra_id integer,
    producto_id integer,
    cantidad numeric(12,2),
    precio_unitario numeric(12,2),
    subtotal numeric(12,2)
);


ALTER TABLE public.compras_detalles OWNER TO postgres;

--
-- TOC entry 256 (class 1259 OID 31414)
-- Name: compras_detalles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.compras_detalles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.compras_detalles_id_seq OWNER TO postgres;

--
-- TOC entry 5603 (class 0 OID 0)
-- Dependencies: 256
-- Name: compras_detalles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.compras_detalles_id_seq OWNED BY public.compras_detalles.id;


--
-- TOC entry 254 (class 1259 OID 31397)
-- Name: compras_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.compras_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.compras_id_seq OWNER TO postgres;

--
-- TOC entry 5604 (class 0 OID 0)
-- Dependencies: 254
-- Name: compras_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.compras_id_seq OWNED BY public.compras.id;


--
-- TOC entry 315 (class 1259 OID 31907)
-- Name: comprobantes_pago; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comprobantes_pago (
    id integer NOT NULL,
    cobro_id integer,
    tipo_documento_id integer,
    numero character varying(50),
    fecha_emision date
);


ALTER TABLE public.comprobantes_pago OWNER TO postgres;

--
-- TOC entry 314 (class 1259 OID 31906)
-- Name: comprobantes_pago_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comprobantes_pago_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.comprobantes_pago_id_seq OWNER TO postgres;

--
-- TOC entry 5605 (class 0 OID 0)
-- Dependencies: 314
-- Name: comprobantes_pago_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comprobantes_pago_id_seq OWNED BY public.comprobantes_pago.id;


--
-- TOC entry 339 (class 1259 OID 32126)
-- Name: configuracion_timbrados; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.configuracion_timbrados (
    id integer NOT NULL,
    numero_timbrado character varying(20),
    punto_expedicion character varying(10),
    sucursal_id integer,
    fecha_inicio date,
    fecha_fin date,
    tipo_documento_id integer,
    activo boolean DEFAULT true
);


ALTER TABLE public.configuracion_timbrados OWNER TO postgres;

--
-- TOC entry 338 (class 1259 OID 32125)
-- Name: configuracion_timbrados_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.configuracion_timbrados_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.configuracion_timbrados_id_seq OWNER TO postgres;

--
-- TOC entry 5606 (class 0 OID 0)
-- Dependencies: 338
-- Name: configuracion_timbrados_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.configuracion_timbrados_id_seq OWNED BY public.configuracion_timbrados.id;


--
-- TOC entry 259 (class 1259 OID 31432)
-- Name: cuentas_por_pagar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cuentas_por_pagar (
    id integer NOT NULL,
    compra_id integer,
    monto_total numeric(12,2),
    fecha_vencimiento date,
    estado character varying(50)
);


ALTER TABLE public.cuentas_por_pagar OWNER TO postgres;

--
-- TOC entry 258 (class 1259 OID 31431)
-- Name: cuentas_por_pagar_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cuentas_por_pagar_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cuentas_por_pagar_id_seq OWNER TO postgres;

--
-- TOC entry 5607 (class 0 OID 0)
-- Dependencies: 258
-- Name: cuentas_por_pagar_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cuentas_por_pagar_id_seq OWNED BY public.cuentas_por_pagar.id;


--
-- TOC entry 261 (class 1259 OID 31444)
-- Name: cuentas_por_pagar_pagos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cuentas_por_pagar_pagos (
    id integer NOT NULL,
    cuenta_id integer,
    fecha_pago date,
    monto_pagado numeric(12,2),
    forma_pago_id integer,
    banco_id integer,
    referencia_transaccion character varying(100)
);


ALTER TABLE public.cuentas_por_pagar_pagos OWNER TO postgres;

--
-- TOC entry 260 (class 1259 OID 31443)
-- Name: cuentas_por_pagar_pagos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cuentas_por_pagar_pagos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cuentas_por_pagar_pagos_id_seq OWNER TO postgres;

--
-- TOC entry 5608 (class 0 OID 0)
-- Dependencies: 260
-- Name: cuentas_por_pagar_pagos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cuentas_por_pagar_pagos_id_seq OWNED BY public.cuentas_por_pagar_pagos.id;


--
-- TOC entry 245 (class 1259 OID 31248)
-- Name: depositos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.depositos (
    id integer NOT NULL,
    nombre character varying(100),
    direccion text,
    sucursal_id integer
);


ALTER TABLE public.depositos OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 31247)
-- Name: depositos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.depositos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.depositos_id_seq OWNER TO postgres;

--
-- TOC entry 5609 (class 0 OID 0)
-- Dependencies: 244
-- Name: depositos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.depositos_id_seq OWNED BY public.depositos.id;


--
-- TOC entry 313 (class 1259 OID 31885)
-- Name: detalle_cobros; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.detalle_cobros (
    id integer NOT NULL,
    cobro_id integer,
    forma_pago_id integer,
    banco_id integer,
    monto numeric(12,2),
    transaccion_id character varying(100),
    autorizacion_codigo character varying(100),
    emisor character varying(100),
    fecha_transaccion timestamp without time zone
);


ALTER TABLE public.detalle_cobros OWNER TO postgres;

--
-- TOC entry 312 (class 1259 OID 31884)
-- Name: detalle_cobros_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.detalle_cobros_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.detalle_cobros_id_seq OWNER TO postgres;

--
-- TOC entry 5610 (class 0 OID 0)
-- Dependencies: 312
-- Name: detalle_cobros_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.detalle_cobros_id_seq OWNED BY public.detalle_cobros.id;


--
-- TOC entry 307 (class 1259 OID 31830)
-- Name: detalle_facturas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.detalle_facturas (
    id integer NOT NULL,
    factura_id integer,
    producto_id integer,
    cantidad numeric(12,2),
    precio_unitario numeric(12,2),
    subtotal numeric(12,2),
    iva_tipo character varying(10),
    iva_monto numeric(12,2)
);


ALTER TABLE public.detalle_facturas OWNER TO postgres;

--
-- TOC entry 306 (class 1259 OID 31829)
-- Name: detalle_facturas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.detalle_facturas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.detalle_facturas_id_seq OWNER TO postgres;

--
-- TOC entry 5611 (class 0 OID 0)
-- Dependencies: 306
-- Name: detalle_facturas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.detalle_facturas_id_seq OWNED BY public.detalle_facturas.id;


--
-- TOC entry 345 (class 1259 OID 33561)
-- Name: detalle_servicio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.detalle_servicio (
    costo double precision,
    id bigint NOT NULL,
    servicio_id bigint,
    descripcion character varying(255)
);


ALTER TABLE public.detalle_servicio OWNER TO postgres;

--
-- TOC entry 344 (class 1259 OID 33560)
-- Name: detalle_servicio_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.detalle_servicio ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.detalle_servicio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 299 (class 1259 OID 31740)
-- Name: detalle_ventas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.detalle_ventas (
    id integer NOT NULL,
    venta_id integer,
    producto_id integer,
    cantidad numeric(12,2),
    precio_unitario numeric(12,2),
    subtotal numeric(12,2),
    iva_tipo character varying(10),
    iva_monto numeric(12,2)
);


ALTER TABLE public.detalle_ventas OWNER TO postgres;

--
-- TOC entry 298 (class 1259 OID 31739)
-- Name: detalle_ventas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.detalle_ventas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.detalle_ventas_id_seq OWNER TO postgres;

--
-- TOC entry 5612 (class 0 OID 0)
-- Dependencies: 298
-- Name: detalle_ventas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.detalle_ventas_id_seq OWNED BY public.detalle_ventas.id;


--
-- TOC entry 271 (class 1259 OID 31520)
-- Name: diagnosticos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.diagnosticos (
    id integer NOT NULL,
    recepcion_id integer,
    tecnico_id integer,
    fecha date,
    descripcion text,
    estado character varying(50),
    usuario_id integer
);


ALTER TABLE public.diagnosticos OWNER TO postgres;

--
-- TOC entry 270 (class 1259 OID 31519)
-- Name: diagnosticos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.diagnosticos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.diagnosticos_id_seq OWNER TO postgres;

--
-- TOC entry 5613 (class 0 OID 0)
-- Dependencies: 270
-- Name: diagnosticos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.diagnosticos_id_seq OWNED BY public.diagnosticos.id;


--
-- TOC entry 218 (class 1259 OID 31055)
-- Name: empresa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.empresa (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    ruc character varying(20) NOT NULL,
    direccion text,
    telefono character varying(20),
    email character varying(100)
);


ALTER TABLE public.empresa OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 31054)
-- Name: empresa_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.empresa_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.empresa_id_seq OWNER TO postgres;

--
-- TOC entry 5614 (class 0 OID 0)
-- Dependencies: 217
-- Name: empresa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.empresa_id_seq OWNED BY public.empresa.id;


--
-- TOC entry 305 (class 1259 OID 31808)
-- Name: facturas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.facturas (
    id integer NOT NULL,
    venta_id integer,
    cliente_id integer,
    fecha_emision date,
    tipo_documento_id integer,
    total numeric(12,2),
    numero character varying(50),
    timbrado character varying(20),
    fecha_inicio_vigencia date,
    fecha_fin_vigencia date,
    estado character varying(20),
    configuracion_timbrado_id integer,
    usuario_id integer
);


ALTER TABLE public.facturas OWNER TO postgres;

--
-- TOC entry 304 (class 1259 OID 31807)
-- Name: facturas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.facturas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.facturas_id_seq OWNER TO postgres;

--
-- TOC entry 5615 (class 0 OID 0)
-- Dependencies: 304
-- Name: facturas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.facturas_id_seq OWNED BY public.facturas.id;


--
-- TOC entry 239 (class 1259 OID 31215)
-- Name: formas_pago; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.formas_pago (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL
);


ALTER TABLE public.formas_pago OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 31214)
-- Name: formas_pago_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.formas_pago_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.formas_pago_id_seq OWNER TO postgres;

--
-- TOC entry 5616 (class 0 OID 0)
-- Dependencies: 238
-- Name: formas_pago_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.formas_pago_id_seq OWNED BY public.formas_pago.id;


--
-- TOC entry 285 (class 1259 OID 31632)
-- Name: garantias_servicio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.garantias_servicio (
    id integer NOT NULL,
    servicio_id integer,
    fecha_inicio date,
    fecha_fin date,
    condiciones text,
    usuario_id integer
);


ALTER TABLE public.garantias_servicio OWNER TO postgres;

--
-- TOC entry 284 (class 1259 OID 31631)
-- Name: garantias_servicio_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.garantias_servicio_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.garantias_servicio_id_seq OWNER TO postgres;

--
-- TOC entry 5617 (class 0 OID 0)
-- Dependencies: 284
-- Name: garantias_servicio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.garantias_servicio_id_seq OWNED BY public.garantias_servicio.id;


--
-- TOC entry 335 (class 1259 OID 32064)
-- Name: historial_accesos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.historial_accesos (
    id integer NOT NULL,
    usuario_id integer,
    fecha_entrada timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    ip_origen character varying(50),
    exito boolean
);


ALTER TABLE public.historial_accesos OWNER TO postgres;

--
-- TOC entry 334 (class 1259 OID 32063)
-- Name: historial_accesos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.historial_accesos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.historial_accesos_id_seq OWNER TO postgres;

--
-- TOC entry 5618 (class 0 OID 0)
-- Dependencies: 334
-- Name: historial_accesos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.historial_accesos_id_seq OWNED BY public.historial_accesos.id;


--
-- TOC entry 263 (class 1259 OID 31466)
-- Name: libro_iva_compras; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.libro_iva_compras (
    id integer NOT NULL,
    compra_id integer,
    fecha date,
    ruc_proveedor character varying(20),
    monto_exento numeric(12,2),
    monto_gravado numeric(12,2),
    iva_10 numeric(12,2),
    iva_5 numeric(12,2),
    total numeric(12,2)
);


ALTER TABLE public.libro_iva_compras OWNER TO postgres;

--
-- TOC entry 262 (class 1259 OID 31465)
-- Name: libro_iva_compras_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.libro_iva_compras_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.libro_iva_compras_id_seq OWNER TO postgres;

--
-- TOC entry 5619 (class 0 OID 0)
-- Dependencies: 262
-- Name: libro_iva_compras_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.libro_iva_compras_id_seq OWNED BY public.libro_iva_compras.id;


--
-- TOC entry 337 (class 1259 OID 32088)
-- Name: libro_iva_ventas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.libro_iva_ventas (
    id integer NOT NULL,
    venta_id integer,
    fecha date,
    ruc_cliente character varying(20),
    monto_exento numeric(12,2),
    monto_gravado numeric(12,2),
    iva_10 numeric(12,2),
    iva_5 numeric(12,2),
    total numeric(12,2)
);


ALTER TABLE public.libro_iva_ventas OWNER TO postgres;

--
-- TOC entry 336 (class 1259 OID 32087)
-- Name: libro_iva_ventas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.libro_iva_ventas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.libro_iva_ventas_id_seq OWNER TO postgres;

--
-- TOC entry 5620 (class 0 OID 0)
-- Dependencies: 336
-- Name: libro_iva_ventas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.libro_iva_ventas_id_seq OWNED BY public.libro_iva_ventas.id;


--
-- TOC entry 333 (class 1259 OID 32054)
-- Name: log_errores_sistema; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.log_errores_sistema (
    id integer NOT NULL,
    fecha timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    mensaje_error text,
    modulo character varying(50)
);


ALTER TABLE public.log_errores_sistema OWNER TO postgres;

--
-- TOC entry 332 (class 1259 OID 32053)
-- Name: log_errores_sistema_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.log_errores_sistema_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.log_errores_sistema_id_seq OWNER TO postgres;

--
-- TOC entry 5621 (class 0 OID 0)
-- Dependencies: 332
-- Name: log_errores_sistema_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.log_errores_sistema_id_seq OWNED BY public.log_errores_sistema.id;


--
-- TOC entry 325 (class 1259 OID 31979)
-- Name: movimientos_caja; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movimientos_caja (
    id integer NOT NULL,
    sesion_id integer,
    tipo_movimiento character varying(50),
    monto numeric(12,2),
    forma_pago_id integer,
    banco_id integer,
    transaccion_id character varying(100),
    referencia_documento character varying(100),
    modulo_origen character varying(50)
);


ALTER TABLE public.movimientos_caja OWNER TO postgres;

--
-- TOC entry 324 (class 1259 OID 31978)
-- Name: movimientos_caja_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.movimientos_caja_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.movimientos_caja_id_seq OWNER TO postgres;

--
-- TOC entry 5622 (class 0 OID 0)
-- Dependencies: 324
-- Name: movimientos_caja_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.movimientos_caja_id_seq OWNED BY public.movimientos_caja.id;


--
-- TOC entry 267 (class 1259 OID 31492)
-- Name: notas_credito_debito_compra; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notas_credito_debito_compra (
    id integer NOT NULL,
    compra_id integer,
    tipo character varying(50),
    fecha date,
    monto numeric(12,2),
    motivo text
);


ALTER TABLE public.notas_credito_debito_compra OWNER TO postgres;

--
-- TOC entry 266 (class 1259 OID 31491)
-- Name: notas_credito_debito_compra_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.notas_credito_debito_compra_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.notas_credito_debito_compra_id_seq OWNER TO postgres;

--
-- TOC entry 5623 (class 0 OID 0)
-- Dependencies: 266
-- Name: notas_credito_debito_compra_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.notas_credito_debito_compra_id_seq OWNED BY public.notas_credito_debito_compra.id;


--
-- TOC entry 309 (class 1259 OID 31859)
-- Name: notas_credito_debito_venta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notas_credito_debito_venta (
    id integer NOT NULL,
    venta_id integer,
    tipo character varying(50),
    fecha date,
    monto numeric(12,2),
    motivo text
);


ALTER TABLE public.notas_credito_debito_venta OWNER TO postgres;

--
-- TOC entry 308 (class 1259 OID 31858)
-- Name: notas_credito_debito_venta_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.notas_credito_debito_venta_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.notas_credito_debito_venta_id_seq OWNER TO postgres;

--
-- TOC entry 5624 (class 0 OID 0)
-- Dependencies: 308
-- Name: notas_credito_debito_venta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.notas_credito_debito_venta_id_seq OWNED BY public.notas_credito_debito_venta.id;


--
-- TOC entry 301 (class 1259 OID 31757)
-- Name: notas_remision; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notas_remision (
    id integer NOT NULL,
    venta_id integer,
    fecha_emision date,
    usuario_id integer,
    chofer_id integer,
    cliente_id integer,
    vehiculo_id integer,
    observaciones text
);


ALTER TABLE public.notas_remision OWNER TO postgres;

--
-- TOC entry 265 (class 1259 OID 31478)
-- Name: notas_remision_compra; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notas_remision_compra (
    id integer NOT NULL,
    compra_id integer,
    fecha_emision date,
    numero character varying(50),
    observaciones text
);


ALTER TABLE public.notas_remision_compra OWNER TO postgres;

--
-- TOC entry 264 (class 1259 OID 31477)
-- Name: notas_remision_compra_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.notas_remision_compra_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.notas_remision_compra_id_seq OWNER TO postgres;

--
-- TOC entry 5625 (class 0 OID 0)
-- Dependencies: 264
-- Name: notas_remision_compra_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.notas_remision_compra_id_seq OWNED BY public.notas_remision_compra.id;


--
-- TOC entry 303 (class 1259 OID 31791)
-- Name: notas_remision_detalles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notas_remision_detalles (
    id integer NOT NULL,
    nota_remision_id integer,
    producto_id integer,
    cantidad numeric(12,2),
    precio_unitario numeric(12,2),
    subtotal numeric(12,2),
    iva_tipo character varying(10),
    iva_monto numeric(12,2)
);


ALTER TABLE public.notas_remision_detalles OWNER TO postgres;

--
-- TOC entry 302 (class 1259 OID 31790)
-- Name: notas_remision_detalles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.notas_remision_detalles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.notas_remision_detalles_id_seq OWNER TO postgres;

--
-- TOC entry 5626 (class 0 OID 0)
-- Dependencies: 302
-- Name: notas_remision_detalles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.notas_remision_detalles_id_seq OWNED BY public.notas_remision_detalles.id;


--
-- TOC entry 300 (class 1259 OID 31756)
-- Name: notas_remision_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.notas_remision_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.notas_remision_id_seq OWNER TO postgres;

--
-- TOC entry 5627 (class 0 OID 0)
-- Dependencies: 300
-- Name: notas_remision_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.notas_remision_id_seq OWNED BY public.notas_remision.id;


--
-- TOC entry 347 (class 1259 OID 33567)
-- Name: ordenes_compra; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ordenes_compra (
    fecha_orden date NOT NULL,
    id bigint NOT NULL,
    pedido_id bigint,
    estado character varying(50) NOT NULL,
    observaciones character varying(255),
    usuario_id integer
);


ALTER TABLE public.ordenes_compra OWNER TO postgres;

--
-- TOC entry 349 (class 1259 OID 33573)
-- Name: ordenes_compra_detalles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ordenes_compra_detalles (
    cantidad numeric(38,2) NOT NULL,
    precio_unitario numeric(38,2) NOT NULL,
    id bigint NOT NULL,
    orden_id bigint NOT NULL,
    producto_id bigint NOT NULL
);


ALTER TABLE public.ordenes_compra_detalles OWNER TO postgres;

--
-- TOC entry 348 (class 1259 OID 33572)
-- Name: ordenes_compra_detalles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.ordenes_compra_detalles ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.ordenes_compra_detalles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 346 (class 1259 OID 33566)
-- Name: ordenes_compra_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.ordenes_compra ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.ordenes_compra_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 277 (class 1259 OID 31570)
-- Name: ordenes_servicio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ordenes_servicio (
    id integer NOT NULL,
    presupuesto_id integer,
    fecha_generacion date,
    estado character varying(50),
    usuario_id integer
);


ALTER TABLE public.ordenes_servicio OWNER TO postgres;

--
-- TOC entry 276 (class 1259 OID 31569)
-- Name: ordenes_servicio_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ordenes_servicio_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ordenes_servicio_id_seq OWNER TO postgres;

--
-- TOC entry 5628 (class 0 OID 0)
-- Dependencies: 276
-- Name: ordenes_servicio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ordenes_servicio_id_seq OWNED BY public.ordenes_servicio.id;


--
-- TOC entry 351 (class 1259 OID 33579)
-- Name: pedidos_compra; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pedidos_compra (
    fecha_pedido date NOT NULL,
    id bigint NOT NULL,
    proveedor_id bigint NOT NULL,
    estado character varying(50) NOT NULL,
    observaciones character varying(255),
    usuario_id integer
);


ALTER TABLE public.pedidos_compra OWNER TO postgres;

--
-- TOC entry 353 (class 1259 OID 33585)
-- Name: pedidos_compra_detalles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pedidos_compra_detalles (
    cantidad numeric(38,2) NOT NULL,
    precio_estimado numeric(38,2) NOT NULL,
    id bigint NOT NULL,
    pedido_id bigint NOT NULL,
    producto_id bigint NOT NULL
);


ALTER TABLE public.pedidos_compra_detalles OWNER TO postgres;

--
-- TOC entry 352 (class 1259 OID 33584)
-- Name: pedidos_compra_detalles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.pedidos_compra_detalles ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.pedidos_compra_detalles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 350 (class 1259 OID 33578)
-- Name: pedidos_compra_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.pedidos_compra ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.pedidos_compra_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 293 (class 1259 OID 31694)
-- Name: pedidos_venta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pedidos_venta (
    id integer NOT NULL,
    cliente_id integer,
    fecha_pedido date,
    estado character varying(50),
    usuario_id integer
);


ALTER TABLE public.pedidos_venta OWNER TO postgres;

--
-- TOC entry 295 (class 1259 OID 31706)
-- Name: pedidos_venta_detalles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pedidos_venta_detalles (
    id integer NOT NULL,
    pedido_id integer,
    producto_id integer,
    cantidad numeric(12,2),
    precio_unitario numeric(12,2)
);


ALTER TABLE public.pedidos_venta_detalles OWNER TO postgres;

--
-- TOC entry 294 (class 1259 OID 31705)
-- Name: pedidos_venta_detalles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pedidos_venta_detalles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pedidos_venta_detalles_id_seq OWNER TO postgres;

--
-- TOC entry 5629 (class 0 OID 0)
-- Dependencies: 294
-- Name: pedidos_venta_detalles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pedidos_venta_detalles_id_seq OWNED BY public.pedidos_venta_detalles.id;


--
-- TOC entry 292 (class 1259 OID 31693)
-- Name: pedidos_venta_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pedidos_venta_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pedidos_venta_id_seq OWNER TO postgres;

--
-- TOC entry 5630 (class 0 OID 0)
-- Dependencies: 292
-- Name: pedidos_venta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pedidos_venta_id_seq OWNED BY public.pedidos_venta.id;


--
-- TOC entry 222 (class 1259 OID 31071)
-- Name: permisos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.permisos (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    descripcion text
);


ALTER TABLE public.permisos OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 31070)
-- Name: permisos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.permisos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.permisos_id_seq OWNER TO postgres;

--
-- TOC entry 5631 (class 0 OID 0)
-- Dependencies: 221
-- Name: permisos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.permisos_id_seq OWNED BY public.permisos.id;


--
-- TOC entry 229 (class 1259 OID 31142)
-- Name: personal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personal (
    id integer NOT NULL,
    nombre_completo character varying(100),
    cedula_identidad character varying(20),
    telefono character varying(20),
    direccion text,
    email character varying(100),
    usuario_id integer
);


ALTER TABLE public.personal OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 31141)
-- Name: personal_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.personal_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.personal_id_seq OWNER TO postgres;

--
-- TOC entry 5632 (class 0 OID 0)
-- Dependencies: 228
-- Name: personal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.personal_id_seq OWNED BY public.personal.id;


--
-- TOC entry 273 (class 1259 OID 31539)
-- Name: presupuestos_servicio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.presupuestos_servicio (
    id integer NOT NULL,
    recepcion_id integer,
    fecha date,
    total_estimado numeric(12,2),
    estado character varying(50),
    diagnostico_id integer,
    usuario_id integer
);


ALTER TABLE public.presupuestos_servicio OWNER TO postgres;

--
-- TOC entry 275 (class 1259 OID 31551)
-- Name: presupuestos_servicio_detalles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.presupuestos_servicio_detalles (
    id integer NOT NULL,
    presupuesto_id integer,
    descripcion text,
    producto_id integer,
    cantidad numeric(12,2),
    precio_unitario numeric(12,2)
);


ALTER TABLE public.presupuestos_servicio_detalles OWNER TO postgres;

--
-- TOC entry 274 (class 1259 OID 31550)
-- Name: presupuestos_servicio_detalles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.presupuestos_servicio_detalles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.presupuestos_servicio_detalles_id_seq OWNER TO postgres;

--
-- TOC entry 5633 (class 0 OID 0)
-- Dependencies: 274
-- Name: presupuestos_servicio_detalles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.presupuestos_servicio_detalles_id_seq OWNED BY public.presupuestos_servicio_detalles.id;


--
-- TOC entry 272 (class 1259 OID 31538)
-- Name: presupuestos_servicio_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.presupuestos_servicio_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.presupuestos_servicio_id_seq OWNER TO postgres;

--
-- TOC entry 5634 (class 0 OID 0)
-- Dependencies: 272
-- Name: presupuestos_servicio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.presupuestos_servicio_id_seq OWNED BY public.presupuestos_servicio.id;


--
-- TOC entry 289 (class 1259 OID 31665)
-- Name: presupuestos_venta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.presupuestos_venta (
    id integer NOT NULL,
    cliente_id integer,
    fecha date,
    total_estimado numeric(12,2),
    estado character varying(50),
    pedido_id integer,
    usuario_id integer
);


ALTER TABLE public.presupuestos_venta OWNER TO postgres;

--
-- TOC entry 291 (class 1259 OID 31677)
-- Name: presupuestos_venta_detalles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.presupuestos_venta_detalles (
    id integer NOT NULL,
    presupuesto_id integer,
    producto_id integer,
    cantidad numeric(12,2),
    precio_unitario numeric(12,2),
    iva_tipo character varying(10),
    iva_monto numeric(12,2)
);


ALTER TABLE public.presupuestos_venta_detalles OWNER TO postgres;

--
-- TOC entry 290 (class 1259 OID 31676)
-- Name: presupuestos_venta_detalles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.presupuestos_venta_detalles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.presupuestos_venta_detalles_id_seq OWNER TO postgres;

--
-- TOC entry 5635 (class 0 OID 0)
-- Dependencies: 290
-- Name: presupuestos_venta_detalles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.presupuestos_venta_detalles_id_seq OWNED BY public.presupuestos_venta_detalles.id;


--
-- TOC entry 288 (class 1259 OID 31664)
-- Name: presupuestos_venta_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.presupuestos_venta_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.presupuestos_venta_id_seq OWNER TO postgres;

--
-- TOC entry 5636 (class 0 OID 0)
-- Dependencies: 288
-- Name: presupuestos_venta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.presupuestos_venta_id_seq OWNED BY public.presupuestos_venta.id;


--
-- TOC entry 237 (class 1259 OID 31196)
-- Name: productos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.productos (
    id integer NOT NULL,
    nombre character varying(100),
    descripcion text,
    categoria_id integer,
    unidad_medida_id integer,
    precio_referencia numeric(12,2),
    codigo_interno character varying(50),
    codigo_barra character varying(50),
    iva_tipo character varying(10),
    costo_promedio numeric(12,2)
);


ALTER TABLE public.productos OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 31195)
-- Name: productos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.productos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.productos_id_seq OWNER TO postgres;

--
-- TOC entry 5637 (class 0 OID 0)
-- Dependencies: 236
-- Name: productos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.productos_id_seq OWNED BY public.productos.id;


--
-- TOC entry 253 (class 1259 OID 31327)
-- Name: proveedores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.proveedores (
    id integer NOT NULL,
    nombre character varying(100),
    ruc character varying(20),
    direccion text,
    telefono character varying(20),
    email character varying(100)
);


ALTER TABLE public.proveedores OWNER TO postgres;

--
-- TOC entry 252 (class 1259 OID 31326)
-- Name: proveedores_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.proveedores_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.proveedores_id_seq OWNER TO postgres;

--
-- TOC entry 5638 (class 0 OID 0)
-- Dependencies: 252
-- Name: proveedores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.proveedores_id_seq OWNED BY public.proveedores.id;


--
-- TOC entry 329 (class 1259 OID 32015)
-- Name: recaudaciones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recaudaciones (
    id integer NOT NULL,
    sesion_id integer NOT NULL,
    fecha_deposito date NOT NULL,
    banco_id integer NOT NULL,
    monto numeric(12,2) NOT NULL,
    forma_pago_id integer,
    observaciones text,
    usuario_id integer
);


ALTER TABLE public.recaudaciones OWNER TO postgres;

--
-- TOC entry 328 (class 1259 OID 32014)
-- Name: recaudaciones_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.recaudaciones_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.recaudaciones_id_seq OWNER TO postgres;

--
-- TOC entry 5639 (class 0 OID 0)
-- Dependencies: 328
-- Name: recaudaciones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.recaudaciones_id_seq OWNED BY public.recaudaciones.id;


--
-- TOC entry 269 (class 1259 OID 31506)
-- Name: recepcion_equipos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recepcion_equipos (
    id integer NOT NULL,
    cliente_id integer,
    fecha_recepcion date,
    descripcion_equipo text,
    observaciones text,
    usuario_id integer
);


ALTER TABLE public.recepcion_equipos OWNER TO postgres;

--
-- TOC entry 268 (class 1259 OID 31505)
-- Name: recepcion_equipos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.recepcion_equipos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.recepcion_equipos_id_seq OWNER TO postgres;

--
-- TOC entry 5640 (class 0 OID 0)
-- Dependencies: 268
-- Name: recepcion_equipos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.recepcion_equipos_id_seq OWNED BY public.recepcion_equipos.id;


--
-- TOC entry 287 (class 1259 OID 31646)
-- Name: reclamos_servicio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reclamos_servicio (
    id integer NOT NULL,
    cliente_id integer,
    fecha date,
    descripcion text,
    estado character varying(50),
    referencia_servicio_id integer,
    usuario_id integer
);


ALTER TABLE public.reclamos_servicio OWNER TO postgres;

--
-- TOC entry 286 (class 1259 OID 31645)
-- Name: reclamos_servicio_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reclamos_servicio_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.reclamos_servicio_id_seq OWNER TO postgres;

--
-- TOC entry 5641 (class 0 OID 0)
-- Dependencies: 286
-- Name: reclamos_servicio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reclamos_servicio_id_seq OWNED BY public.reclamos_servicio.id;


--
-- TOC entry 283 (class 1259 OID 31618)
-- Name: retiros_equipos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.retiros_equipos (
    id integer NOT NULL,
    recepcion_id integer,
    fecha_retiro date,
    entregado_por character varying(100),
    retirado_por character varying(100),
    observaciones text,
    usuario_id integer
);


ALTER TABLE public.retiros_equipos OWNER TO postgres;

--
-- TOC entry 282 (class 1259 OID 31617)
-- Name: retiros_equipos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.retiros_equipos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.retiros_equipos_id_seq OWNER TO postgres;

--
-- TOC entry 5642 (class 0 OID 0)
-- Dependencies: 282
-- Name: retiros_equipos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.retiros_equipos_id_seq OWNED BY public.retiros_equipos.id;


--
-- TOC entry 220 (class 1259 OID 31064)
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 31063)
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.roles_id_seq OWNER TO postgres;

--
-- TOC entry 5643 (class 0 OID 0)
-- Dependencies: 219
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- TOC entry 227 (class 1259 OID 31126)
-- Name: roles_permisos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles_permisos (
    rol_id integer NOT NULL,
    permiso_id integer NOT NULL
);


ALTER TABLE public.roles_permisos OWNER TO postgres;

--
-- TOC entry 281 (class 1259 OID 31601)
-- Name: servicios_insumos_utilizados; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.servicios_insumos_utilizados (
    id integer NOT NULL,
    servicio_id integer,
    producto_id integer,
    cantidad numeric(12,2)
);


ALTER TABLE public.servicios_insumos_utilizados OWNER TO postgres;

--
-- TOC entry 280 (class 1259 OID 31600)
-- Name: servicios_insumos_utilizados_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.servicios_insumos_utilizados_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.servicios_insumos_utilizados_id_seq OWNER TO postgres;

--
-- TOC entry 5644 (class 0 OID 0)
-- Dependencies: 280
-- Name: servicios_insumos_utilizados_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.servicios_insumos_utilizados_id_seq OWNED BY public.servicios_insumos_utilizados.id;


--
-- TOC entry 279 (class 1259 OID 31582)
-- Name: servicios_realizados; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.servicios_realizados (
    id integer NOT NULL,
    orden_id integer,
    tecnico_id integer,
    descripcion text,
    fecha_inicio date,
    fecha_fin date,
    costo_total numeric(12,2),
    usuario_id integer
);


ALTER TABLE public.servicios_realizados OWNER TO postgres;

--
-- TOC entry 278 (class 1259 OID 31581)
-- Name: servicios_realizados_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.servicios_realizados_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.servicios_realizados_id_seq OWNER TO postgres;

--
-- TOC entry 5645 (class 0 OID 0)
-- Dependencies: 278
-- Name: servicios_realizados_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.servicios_realizados_id_seq OWNED BY public.servicios_realizados.id;


--
-- TOC entry 319 (class 1259 OID 31938)
-- Name: sesiones_caja; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sesiones_caja (
    id integer NOT NULL,
    usuario_id integer,
    caja_id integer,
    fecha_apertura timestamp without time zone,
    fecha_cierre timestamp without time zone,
    estado character varying(50)
);


ALTER TABLE public.sesiones_caja OWNER TO postgres;

--
-- TOC entry 318 (class 1259 OID 31937)
-- Name: sesiones_caja_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sesiones_caja_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sesiones_caja_id_seq OWNER TO postgres;

--
-- TOC entry 5646 (class 0 OID 0)
-- Dependencies: 318
-- Name: sesiones_caja_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sesiones_caja_id_seq OWNED BY public.sesiones_caja.id;


--
-- TOC entry 247 (class 1259 OID 31262)
-- Name: stock_actual; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stock_actual (
    id integer NOT NULL,
    producto_id integer,
    deposito_id integer,
    cantidad_actual numeric(12,2)
);


ALTER TABLE public.stock_actual OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 31261)
-- Name: stock_actual_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.stock_actual_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.stock_actual_id_seq OWNER TO postgres;

--
-- TOC entry 5647 (class 0 OID 0)
-- Dependencies: 246
-- Name: stock_actual_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.stock_actual_id_seq OWNED BY public.stock_actual.id;


--
-- TOC entry 249 (class 1259 OID 31279)
-- Name: stock_movimientos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stock_movimientos (
    id integer NOT NULL,
    producto_id integer,
    tipo_movimiento character varying(50),
    cantidad numeric(12,2),
    fecha timestamp without time zone,
    motivo text,
    deposito_id integer,
    referencia_id integer,
    modulo_origen character varying(50),
    usuario_id integer
);


ALTER TABLE public.stock_movimientos OWNER TO postgres;

--
-- TOC entry 248 (class 1259 OID 31278)
-- Name: stock_movimientos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.stock_movimientos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.stock_movimientos_id_seq OWNER TO postgres;

--
-- TOC entry 5648 (class 0 OID 0)
-- Dependencies: 248
-- Name: stock_movimientos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.stock_movimientos_id_seq OWNED BY public.stock_movimientos.id;


--
-- TOC entry 231 (class 1259 OID 31156)
-- Name: sucursales; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sucursales (
    id integer NOT NULL,
    nombre character varying(100),
    direccion text,
    empresa_id integer
);


ALTER TABLE public.sucursales OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 31155)
-- Name: sucursales_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sucursales_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sucursales_id_seq OWNER TO postgres;

--
-- TOC entry 5649 (class 0 OID 0)
-- Dependencies: 230
-- Name: sucursales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sucursales_id_seq OWNED BY public.sucursales.id;


--
-- TOC entry 243 (class 1259 OID 31236)
-- Name: tarjetas_bancarias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tarjetas_bancarias (
    id integer NOT NULL,
    banco_id integer,
    tipo character varying(50),
    nombre_comercial character varying(100)
);


ALTER TABLE public.tarjetas_bancarias OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 31235)
-- Name: tarjetas_bancarias_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tarjetas_bancarias_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tarjetas_bancarias_id_seq OWNER TO postgres;

--
-- TOC entry 5650 (class 0 OID 0)
-- Dependencies: 242
-- Name: tarjetas_bancarias_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tarjetas_bancarias_id_seq OWNED BY public.tarjetas_bancarias.id;


--
-- TOC entry 355 (class 1259 OID 33621)
-- Name: tipos_documento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipos_documento (
    id bigint NOT NULL,
    nombre character varying(50) NOT NULL
);


ALTER TABLE public.tipos_documento OWNER TO postgres;

--
-- TOC entry 354 (class 1259 OID 33620)
-- Name: tipos_documento_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.tipos_documento ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.tipos_documento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 251 (class 1259 OID 31298)
-- Name: transferencias_stock; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transferencias_stock (
    id integer NOT NULL,
    producto_id integer,
    deposito_origen_id integer,
    deposito_destino_id integer,
    cantidad numeric(12,2),
    fecha timestamp without time zone,
    motivo text,
    usuario_id integer
);


ALTER TABLE public.transferencias_stock OWNER TO postgres;

--
-- TOC entry 250 (class 1259 OID 31297)
-- Name: transferencias_stock_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.transferencias_stock_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.transferencias_stock_id_seq OWNER TO postgres;

--
-- TOC entry 5651 (class 0 OID 0)
-- Dependencies: 250
-- Name: transferencias_stock_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transferencias_stock_id_seq OWNED BY public.transferencias_stock.id;


--
-- TOC entry 235 (class 1259 OID 31189)
-- Name: unidades_medida; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.unidades_medida (
    id integer NOT NULL,
    nombre character varying(50),
    simbolo character varying(10)
);


ALTER TABLE public.unidades_medida OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 31188)
-- Name: unidades_medida_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.unidades_medida_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.unidades_medida_id_seq OWNER TO postgres;

--
-- TOC entry 5652 (class 0 OID 0)
-- Dependencies: 234
-- Name: unidades_medida_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.unidades_medida_id_seq OWNED BY public.unidades_medida.id;


--
-- TOC entry 224 (class 1259 OID 31080)
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    password_hash text NOT NULL,
    activo smallint DEFAULT 1,
    empresa_id integer
);


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 31079)
-- Name: usuarios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuarios_id_seq OWNER TO postgres;

--
-- TOC entry 5653 (class 0 OID 0)
-- Dependencies: 223
-- Name: usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuarios_id_seq OWNED BY public.usuarios.id;


--
-- TOC entry 226 (class 1259 OID 31111)
-- Name: usuarios_permisos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios_permisos (
    usuario_id integer NOT NULL,
    permiso_id integer NOT NULL
);


ALTER TABLE public.usuarios_permisos OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 31096)
-- Name: usuarios_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios_roles (
    usuario_id integer NOT NULL,
    rol_id integer NOT NULL
);


ALTER TABLE public.usuarios_roles OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 31170)
-- Name: vehiculos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vehiculos (
    id integer NOT NULL,
    matricula character varying(20),
    marca character varying(50),
    modelo character varying(50),
    capacidad character varying(50),
    sucursal_id integer
);


ALTER TABLE public.vehiculos OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 31169)
-- Name: vehiculos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vehiculos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vehiculos_id_seq OWNER TO postgres;

--
-- TOC entry 5654 (class 0 OID 0)
-- Dependencies: 232
-- Name: vehiculos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vehiculos_id_seq OWNED BY public.vehiculos.id;


--
-- TOC entry 297 (class 1259 OID 31723)
-- Name: ventas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ventas (
    id integer NOT NULL,
    cliente_id integer,
    fecha_venta date,
    tipo_documento_id integer,
    total numeric(12,2),
    estado character varying(50),
    presupuesto_id integer,
    pedido_id integer,
    usuario_id integer
);


ALTER TABLE public.ventas OWNER TO postgres;

--
-- TOC entry 296 (class 1259 OID 31722)
-- Name: ventas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ventas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ventas_id_seq OWNER TO postgres;

--
-- TOC entry 5655 (class 0 OID 0)
-- Dependencies: 296
-- Name: ventas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ventas_id_seq OWNED BY public.ventas.id;


--
-- TOC entry 5022 (class 2604 OID 31958)
-- Name: apertura_caja id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.apertura_caja ALTER COLUMN id SET DEFAULT nextval('public.apertura_caja_id_seq'::regclass);


--
-- TOC entry 5025 (class 2604 OID 32004)
-- Name: arqueo_caja id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.arqueo_caja ALTER COLUMN id SET DEFAULT nextval('public.arqueo_caja_id_seq'::regclass);


--
-- TOC entry 5027 (class 2604 OID 32042)
-- Name: auditoria_movimientos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auditoria_movimientos ALTER COLUMN id SET DEFAULT nextval('public.auditoria_movimientos_id_seq'::regclass);


--
-- TOC entry 4982 (class 2604 OID 31232)
-- Name: bancos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bancos ALTER COLUMN id SET DEFAULT nextval('public.bancos_id_seq'::regclass);


--
-- TOC entry 5020 (class 2604 OID 31927)
-- Name: cajas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cajas ALTER COLUMN id SET DEFAULT nextval('public.cajas_id_seq'::regclass);


--
-- TOC entry 5023 (class 2604 OID 31970)
-- Name: cierre_caja id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cierre_caja ALTER COLUMN id SET DEFAULT nextval('public.cierre_caja_id_seq'::regclass);


--
-- TOC entry 5017 (class 2604 OID 31876)
-- Name: cobros id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cobros ALTER COLUMN id SET DEFAULT nextval('public.cobros_id_seq'::regclass);


--
-- TOC entry 4989 (class 2604 OID 31401)
-- Name: compras id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compras ALTER COLUMN id SET DEFAULT nextval('public.compras_id_seq'::regclass);


--
-- TOC entry 4990 (class 2604 OID 31418)
-- Name: compras_detalles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compras_detalles ALTER COLUMN id SET DEFAULT nextval('public.compras_detalles_id_seq'::regclass);


--
-- TOC entry 5019 (class 2604 OID 31910)
-- Name: comprobantes_pago id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comprobantes_pago ALTER COLUMN id SET DEFAULT nextval('public.comprobantes_pago_id_seq'::regclass);


--
-- TOC entry 5034 (class 2604 OID 32129)
-- Name: configuracion_timbrados id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.configuracion_timbrados ALTER COLUMN id SET DEFAULT nextval('public.configuracion_timbrados_id_seq'::regclass);


--
-- TOC entry 4991 (class 2604 OID 31435)
-- Name: cuentas_por_pagar id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuentas_por_pagar ALTER COLUMN id SET DEFAULT nextval('public.cuentas_por_pagar_id_seq'::regclass);


--
-- TOC entry 4992 (class 2604 OID 31447)
-- Name: cuentas_por_pagar_pagos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuentas_por_pagar_pagos ALTER COLUMN id SET DEFAULT nextval('public.cuentas_por_pagar_pagos_id_seq'::regclass);


--
-- TOC entry 4984 (class 2604 OID 31251)
-- Name: depositos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.depositos ALTER COLUMN id SET DEFAULT nextval('public.depositos_id_seq'::regclass);


--
-- TOC entry 5018 (class 2604 OID 31888)
-- Name: detalle_cobros id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_cobros ALTER COLUMN id SET DEFAULT nextval('public.detalle_cobros_id_seq'::regclass);


--
-- TOC entry 5015 (class 2604 OID 31833)
-- Name: detalle_facturas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_facturas ALTER COLUMN id SET DEFAULT nextval('public.detalle_facturas_id_seq'::regclass);


--
-- TOC entry 5011 (class 2604 OID 31743)
-- Name: detalle_ventas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_ventas ALTER COLUMN id SET DEFAULT nextval('public.detalle_ventas_id_seq'::regclass);


--
-- TOC entry 4997 (class 2604 OID 31523)
-- Name: diagnosticos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.diagnosticos ALTER COLUMN id SET DEFAULT nextval('public.diagnosticos_id_seq'::regclass);


--
-- TOC entry 4971 (class 2604 OID 31058)
-- Name: empresa id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empresa ALTER COLUMN id SET DEFAULT nextval('public.empresa_id_seq'::regclass);


--
-- TOC entry 5014 (class 2604 OID 31811)
-- Name: facturas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facturas ALTER COLUMN id SET DEFAULT nextval('public.facturas_id_seq'::regclass);


--
-- TOC entry 4981 (class 2604 OID 31218)
-- Name: formas_pago id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.formas_pago ALTER COLUMN id SET DEFAULT nextval('public.formas_pago_id_seq'::regclass);


--
-- TOC entry 5004 (class 2604 OID 31635)
-- Name: garantias_servicio id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.garantias_servicio ALTER COLUMN id SET DEFAULT nextval('public.garantias_servicio_id_seq'::regclass);


--
-- TOC entry 5031 (class 2604 OID 32067)
-- Name: historial_accesos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historial_accesos ALTER COLUMN id SET DEFAULT nextval('public.historial_accesos_id_seq'::regclass);


--
-- TOC entry 4993 (class 2604 OID 31469)
-- Name: libro_iva_compras id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libro_iva_compras ALTER COLUMN id SET DEFAULT nextval('public.libro_iva_compras_id_seq'::regclass);


--
-- TOC entry 5033 (class 2604 OID 32091)
-- Name: libro_iva_ventas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libro_iva_ventas ALTER COLUMN id SET DEFAULT nextval('public.libro_iva_ventas_id_seq'::regclass);


--
-- TOC entry 5029 (class 2604 OID 32057)
-- Name: log_errores_sistema id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.log_errores_sistema ALTER COLUMN id SET DEFAULT nextval('public.log_errores_sistema_id_seq'::regclass);


--
-- TOC entry 5024 (class 2604 OID 31982)
-- Name: movimientos_caja id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movimientos_caja ALTER COLUMN id SET DEFAULT nextval('public.movimientos_caja_id_seq'::regclass);


--
-- TOC entry 4995 (class 2604 OID 31495)
-- Name: notas_credito_debito_compra id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notas_credito_debito_compra ALTER COLUMN id SET DEFAULT nextval('public.notas_credito_debito_compra_id_seq'::regclass);


--
-- TOC entry 5016 (class 2604 OID 31862)
-- Name: notas_credito_debito_venta id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notas_credito_debito_venta ALTER COLUMN id SET DEFAULT nextval('public.notas_credito_debito_venta_id_seq'::regclass);


--
-- TOC entry 5012 (class 2604 OID 31760)
-- Name: notas_remision id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notas_remision ALTER COLUMN id SET DEFAULT nextval('public.notas_remision_id_seq'::regclass);


--
-- TOC entry 4994 (class 2604 OID 31481)
-- Name: notas_remision_compra id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notas_remision_compra ALTER COLUMN id SET DEFAULT nextval('public.notas_remision_compra_id_seq'::regclass);


--
-- TOC entry 5013 (class 2604 OID 31794)
-- Name: notas_remision_detalles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notas_remision_detalles ALTER COLUMN id SET DEFAULT nextval('public.notas_remision_detalles_id_seq'::regclass);


--
-- TOC entry 5000 (class 2604 OID 31573)
-- Name: ordenes_servicio id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ordenes_servicio ALTER COLUMN id SET DEFAULT nextval('public.ordenes_servicio_id_seq'::regclass);


--
-- TOC entry 5008 (class 2604 OID 31697)
-- Name: pedidos_venta id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos_venta ALTER COLUMN id SET DEFAULT nextval('public.pedidos_venta_id_seq'::regclass);


--
-- TOC entry 5009 (class 2604 OID 31709)
-- Name: pedidos_venta_detalles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos_venta_detalles ALTER COLUMN id SET DEFAULT nextval('public.pedidos_venta_detalles_id_seq'::regclass);


--
-- TOC entry 4973 (class 2604 OID 31074)
-- Name: permisos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permisos ALTER COLUMN id SET DEFAULT nextval('public.permisos_id_seq'::regclass);


--
-- TOC entry 4976 (class 2604 OID 31145)
-- Name: personal id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal ALTER COLUMN id SET DEFAULT nextval('public.personal_id_seq'::regclass);


--
-- TOC entry 4998 (class 2604 OID 31542)
-- Name: presupuestos_servicio id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.presupuestos_servicio ALTER COLUMN id SET DEFAULT nextval('public.presupuestos_servicio_id_seq'::regclass);


--
-- TOC entry 4999 (class 2604 OID 31554)
-- Name: presupuestos_servicio_detalles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.presupuestos_servicio_detalles ALTER COLUMN id SET DEFAULT nextval('public.presupuestos_servicio_detalles_id_seq'::regclass);


--
-- TOC entry 5006 (class 2604 OID 31668)
-- Name: presupuestos_venta id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.presupuestos_venta ALTER COLUMN id SET DEFAULT nextval('public.presupuestos_venta_id_seq'::regclass);


--
-- TOC entry 5007 (class 2604 OID 31680)
-- Name: presupuestos_venta_detalles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.presupuestos_venta_detalles ALTER COLUMN id SET DEFAULT nextval('public.presupuestos_venta_detalles_id_seq'::regclass);


--
-- TOC entry 4980 (class 2604 OID 31199)
-- Name: productos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos ALTER COLUMN id SET DEFAULT nextval('public.productos_id_seq'::regclass);


--
-- TOC entry 4988 (class 2604 OID 31330)
-- Name: proveedores id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proveedores ALTER COLUMN id SET DEFAULT nextval('public.proveedores_id_seq'::regclass);


--
-- TOC entry 5026 (class 2604 OID 32018)
-- Name: recaudaciones id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recaudaciones ALTER COLUMN id SET DEFAULT nextval('public.recaudaciones_id_seq'::regclass);


--
-- TOC entry 4996 (class 2604 OID 31509)
-- Name: recepcion_equipos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recepcion_equipos ALTER COLUMN id SET DEFAULT nextval('public.recepcion_equipos_id_seq'::regclass);


--
-- TOC entry 5005 (class 2604 OID 31649)
-- Name: reclamos_servicio id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reclamos_servicio ALTER COLUMN id SET DEFAULT nextval('public.reclamos_servicio_id_seq'::regclass);


--
-- TOC entry 5003 (class 2604 OID 31621)
-- Name: retiros_equipos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.retiros_equipos ALTER COLUMN id SET DEFAULT nextval('public.retiros_equipos_id_seq'::regclass);


--
-- TOC entry 4972 (class 2604 OID 31067)
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- TOC entry 5002 (class 2604 OID 31604)
-- Name: servicios_insumos_utilizados id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servicios_insumos_utilizados ALTER COLUMN id SET DEFAULT nextval('public.servicios_insumos_utilizados_id_seq'::regclass);


--
-- TOC entry 5001 (class 2604 OID 31585)
-- Name: servicios_realizados id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servicios_realizados ALTER COLUMN id SET DEFAULT nextval('public.servicios_realizados_id_seq'::regclass);


--
-- TOC entry 5021 (class 2604 OID 31941)
-- Name: sesiones_caja id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sesiones_caja ALTER COLUMN id SET DEFAULT nextval('public.sesiones_caja_id_seq'::regclass);


--
-- TOC entry 4985 (class 2604 OID 31265)
-- Name: stock_actual id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock_actual ALTER COLUMN id SET DEFAULT nextval('public.stock_actual_id_seq'::regclass);


--
-- TOC entry 4986 (class 2604 OID 31282)
-- Name: stock_movimientos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock_movimientos ALTER COLUMN id SET DEFAULT nextval('public.stock_movimientos_id_seq'::regclass);


--
-- TOC entry 4977 (class 2604 OID 31159)
-- Name: sucursales id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sucursales ALTER COLUMN id SET DEFAULT nextval('public.sucursales_id_seq'::regclass);


--
-- TOC entry 4983 (class 2604 OID 31239)
-- Name: tarjetas_bancarias id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tarjetas_bancarias ALTER COLUMN id SET DEFAULT nextval('public.tarjetas_bancarias_id_seq'::regclass);


--
-- TOC entry 4987 (class 2604 OID 31301)
-- Name: transferencias_stock id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transferencias_stock ALTER COLUMN id SET DEFAULT nextval('public.transferencias_stock_id_seq'::regclass);


--
-- TOC entry 4979 (class 2604 OID 31192)
-- Name: unidades_medida id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unidades_medida ALTER COLUMN id SET DEFAULT nextval('public.unidades_medida_id_seq'::regclass);


--
-- TOC entry 4974 (class 2604 OID 31083)
-- Name: usuarios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios ALTER COLUMN id SET DEFAULT nextval('public.usuarios_id_seq'::regclass);


--
-- TOC entry 4978 (class 2604 OID 31173)
-- Name: vehiculos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehiculos ALTER COLUMN id SET DEFAULT nextval('public.vehiculos_id_seq'::regclass);


--
-- TOC entry 5010 (class 2604 OID 31726)
-- Name: ventas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ventas ALTER COLUMN id SET DEFAULT nextval('public.ventas_id_seq'::regclass);


--
-- TOC entry 5556 (class 0 OID 31955)
-- Dependencies: 321
-- Data for Name: apertura_caja; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.apertura_caja (id, sesion_id, monto_inicial) FROM stdin;
\.


--
-- TOC entry 5562 (class 0 OID 32001)
-- Dependencies: 327
-- Data for Name: arqueo_caja; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.arqueo_caja (id, sesion_id, fecha, observaciones, monto_final, monto_real_efectivo, diferencia) FROM stdin;
\.


--
-- TOC entry 5566 (class 0 OID 32039)
-- Dependencies: 331
-- Data for Name: auditoria_movimientos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auditoria_movimientos (id, usuario_id, fecha, tabla_afectada, operacion, descripcion) FROM stdin;
\.


--
-- TOC entry 5476 (class 0 OID 31229)
-- Dependencies: 241
-- Data for Name: bancos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bancos (id, nombre) FROM stdin;
\.


--
-- TOC entry 5552 (class 0 OID 31924)
-- Dependencies: 317
-- Data for Name: cajas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cajas (id, nombre, descripcion, sucursal_id) FROM stdin;
\.


--
-- TOC entry 5576 (class 0 OID 33535)
-- Dependencies: 341
-- Data for Name: categorias_productos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categorias_productos (id, nombre) FROM stdin;
\.


--
-- TOC entry 5558 (class 0 OID 31967)
-- Dependencies: 323
-- Data for Name: cierre_caja; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cierre_caja (id, sesion_id, fecha_cierre, total_efectivo, total_tarjeta, total_transferencia, total_qr, total_vuelto, monto_cierre) FROM stdin;
\.


--
-- TOC entry 5578 (class 0 OID 33541)
-- Dependencies: 343
-- Data for Name: clientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clientes (id, direccion, email, nombre, ruc, telefono) FROM stdin;
\.


--
-- TOC entry 5546 (class 0 OID 31873)
-- Dependencies: 311
-- Data for Name: cobros; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cobros (id, venta_id, fecha, total_cobrado, servicio_id, usuario_id) FROM stdin;
\.


--
-- TOC entry 5490 (class 0 OID 31398)
-- Dependencies: 255
-- Data for Name: compras; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.compras (id, proveedor_id, fecha_compra, numero_factura, tipo_documento_id, condicion_pago, total, estado, orden_compra_id, usuario_id) FROM stdin;
\.


--
-- TOC entry 5492 (class 0 OID 31415)
-- Dependencies: 257
-- Data for Name: compras_detalles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.compras_detalles (id, compra_id, producto_id, cantidad, precio_unitario, subtotal) FROM stdin;
\.


--
-- TOC entry 5550 (class 0 OID 31907)
-- Dependencies: 315
-- Data for Name: comprobantes_pago; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comprobantes_pago (id, cobro_id, tipo_documento_id, numero, fecha_emision) FROM stdin;
\.


--
-- TOC entry 5574 (class 0 OID 32126)
-- Dependencies: 339
-- Data for Name: configuracion_timbrados; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.configuracion_timbrados (id, numero_timbrado, punto_expedicion, sucursal_id, fecha_inicio, fecha_fin, tipo_documento_id, activo) FROM stdin;
\.


--
-- TOC entry 5494 (class 0 OID 31432)
-- Dependencies: 259
-- Data for Name: cuentas_por_pagar; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cuentas_por_pagar (id, compra_id, monto_total, fecha_vencimiento, estado) FROM stdin;
\.


--
-- TOC entry 5496 (class 0 OID 31444)
-- Dependencies: 261
-- Data for Name: cuentas_por_pagar_pagos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cuentas_por_pagar_pagos (id, cuenta_id, fecha_pago, monto_pagado, forma_pago_id, banco_id, referencia_transaccion) FROM stdin;
\.


--
-- TOC entry 5480 (class 0 OID 31248)
-- Dependencies: 245
-- Data for Name: depositos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.depositos (id, nombre, direccion, sucursal_id) FROM stdin;
\.


--
-- TOC entry 5548 (class 0 OID 31885)
-- Dependencies: 313
-- Data for Name: detalle_cobros; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.detalle_cobros (id, cobro_id, forma_pago_id, banco_id, monto, transaccion_id, autorizacion_codigo, emisor, fecha_transaccion) FROM stdin;
\.


--
-- TOC entry 5542 (class 0 OID 31830)
-- Dependencies: 307
-- Data for Name: detalle_facturas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.detalle_facturas (id, factura_id, producto_id, cantidad, precio_unitario, subtotal, iva_tipo, iva_monto) FROM stdin;
\.


--
-- TOC entry 5580 (class 0 OID 33561)
-- Dependencies: 345
-- Data for Name: detalle_servicio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.detalle_servicio (costo, id, servicio_id, descripcion) FROM stdin;
\.


--
-- TOC entry 5534 (class 0 OID 31740)
-- Dependencies: 299
-- Data for Name: detalle_ventas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.detalle_ventas (id, venta_id, producto_id, cantidad, precio_unitario, subtotal, iva_tipo, iva_monto) FROM stdin;
\.


--
-- TOC entry 5506 (class 0 OID 31520)
-- Dependencies: 271
-- Data for Name: diagnosticos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.diagnosticos (id, recepcion_id, tecnico_id, fecha, descripcion, estado, usuario_id) FROM stdin;
\.


--
-- TOC entry 5453 (class 0 OID 31055)
-- Dependencies: 218
-- Data for Name: empresa; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.empresa (id, nombre, ruc, direccion, telefono, email) FROM stdin;
\.


--
-- TOC entry 5540 (class 0 OID 31808)
-- Dependencies: 305
-- Data for Name: facturas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.facturas (id, venta_id, cliente_id, fecha_emision, tipo_documento_id, total, numero, timbrado, fecha_inicio_vigencia, fecha_fin_vigencia, estado, configuracion_timbrado_id, usuario_id) FROM stdin;
\.


--
-- TOC entry 5474 (class 0 OID 31215)
-- Dependencies: 239
-- Data for Name: formas_pago; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.formas_pago (id, nombre) FROM stdin;
\.


--
-- TOC entry 5520 (class 0 OID 31632)
-- Dependencies: 285
-- Data for Name: garantias_servicio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.garantias_servicio (id, servicio_id, fecha_inicio, fecha_fin, condiciones, usuario_id) FROM stdin;
\.


--
-- TOC entry 5570 (class 0 OID 32064)
-- Dependencies: 335
-- Data for Name: historial_accesos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.historial_accesos (id, usuario_id, fecha_entrada, ip_origen, exito) FROM stdin;
\.


--
-- TOC entry 5498 (class 0 OID 31466)
-- Dependencies: 263
-- Data for Name: libro_iva_compras; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.libro_iva_compras (id, compra_id, fecha, ruc_proveedor, monto_exento, monto_gravado, iva_10, iva_5, total) FROM stdin;
\.


--
-- TOC entry 5572 (class 0 OID 32088)
-- Dependencies: 337
-- Data for Name: libro_iva_ventas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.libro_iva_ventas (id, venta_id, fecha, ruc_cliente, monto_exento, monto_gravado, iva_10, iva_5, total) FROM stdin;
\.


--
-- TOC entry 5568 (class 0 OID 32054)
-- Dependencies: 333
-- Data for Name: log_errores_sistema; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.log_errores_sistema (id, fecha, mensaje_error, modulo) FROM stdin;
\.


--
-- TOC entry 5560 (class 0 OID 31979)
-- Dependencies: 325
-- Data for Name: movimientos_caja; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.movimientos_caja (id, sesion_id, tipo_movimiento, monto, forma_pago_id, banco_id, transaccion_id, referencia_documento, modulo_origen) FROM stdin;
\.


--
-- TOC entry 5502 (class 0 OID 31492)
-- Dependencies: 267
-- Data for Name: notas_credito_debito_compra; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.notas_credito_debito_compra (id, compra_id, tipo, fecha, monto, motivo) FROM stdin;
\.


--
-- TOC entry 5544 (class 0 OID 31859)
-- Dependencies: 309
-- Data for Name: notas_credito_debito_venta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.notas_credito_debito_venta (id, venta_id, tipo, fecha, monto, motivo) FROM stdin;
\.


--
-- TOC entry 5536 (class 0 OID 31757)
-- Dependencies: 301
-- Data for Name: notas_remision; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.notas_remision (id, venta_id, fecha_emision, usuario_id, chofer_id, cliente_id, vehiculo_id, observaciones) FROM stdin;
\.


--
-- TOC entry 5500 (class 0 OID 31478)
-- Dependencies: 265
-- Data for Name: notas_remision_compra; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.notas_remision_compra (id, compra_id, fecha_emision, numero, observaciones) FROM stdin;
\.


--
-- TOC entry 5538 (class 0 OID 31791)
-- Dependencies: 303
-- Data for Name: notas_remision_detalles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.notas_remision_detalles (id, nota_remision_id, producto_id, cantidad, precio_unitario, subtotal, iva_tipo, iva_monto) FROM stdin;
\.


--
-- TOC entry 5582 (class 0 OID 33567)
-- Dependencies: 347
-- Data for Name: ordenes_compra; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ordenes_compra (fecha_orden, id, pedido_id, estado, observaciones, usuario_id) FROM stdin;
\.


--
-- TOC entry 5584 (class 0 OID 33573)
-- Dependencies: 349
-- Data for Name: ordenes_compra_detalles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ordenes_compra_detalles (cantidad, precio_unitario, id, orden_id, producto_id) FROM stdin;
\.


--
-- TOC entry 5512 (class 0 OID 31570)
-- Dependencies: 277
-- Data for Name: ordenes_servicio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ordenes_servicio (id, presupuesto_id, fecha_generacion, estado, usuario_id) FROM stdin;
\.


--
-- TOC entry 5586 (class 0 OID 33579)
-- Dependencies: 351
-- Data for Name: pedidos_compra; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pedidos_compra (fecha_pedido, id, proveedor_id, estado, observaciones, usuario_id) FROM stdin;
\.


--
-- TOC entry 5588 (class 0 OID 33585)
-- Dependencies: 353
-- Data for Name: pedidos_compra_detalles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pedidos_compra_detalles (cantidad, precio_estimado, id, pedido_id, producto_id) FROM stdin;
\.


--
-- TOC entry 5528 (class 0 OID 31694)
-- Dependencies: 293
-- Data for Name: pedidos_venta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pedidos_venta (id, cliente_id, fecha_pedido, estado, usuario_id) FROM stdin;
\.


--
-- TOC entry 5530 (class 0 OID 31706)
-- Dependencies: 295
-- Data for Name: pedidos_venta_detalles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pedidos_venta_detalles (id, pedido_id, producto_id, cantidad, precio_unitario) FROM stdin;
\.


--
-- TOC entry 5457 (class 0 OID 31071)
-- Dependencies: 222
-- Data for Name: permisos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.permisos (id, nombre, descripcion) FROM stdin;
\.


--
-- TOC entry 5464 (class 0 OID 31142)
-- Dependencies: 229
-- Data for Name: personal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personal (id, nombre_completo, cedula_identidad, telefono, direccion, email, usuario_id) FROM stdin;
\.


--
-- TOC entry 5508 (class 0 OID 31539)
-- Dependencies: 273
-- Data for Name: presupuestos_servicio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.presupuestos_servicio (id, recepcion_id, fecha, total_estimado, estado, diagnostico_id, usuario_id) FROM stdin;
\.


--
-- TOC entry 5510 (class 0 OID 31551)
-- Dependencies: 275
-- Data for Name: presupuestos_servicio_detalles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.presupuestos_servicio_detalles (id, presupuesto_id, descripcion, producto_id, cantidad, precio_unitario) FROM stdin;
\.


--
-- TOC entry 5524 (class 0 OID 31665)
-- Dependencies: 289
-- Data for Name: presupuestos_venta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.presupuestos_venta (id, cliente_id, fecha, total_estimado, estado, pedido_id, usuario_id) FROM stdin;
\.


--
-- TOC entry 5526 (class 0 OID 31677)
-- Dependencies: 291
-- Data for Name: presupuestos_venta_detalles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.presupuestos_venta_detalles (id, presupuesto_id, producto_id, cantidad, precio_unitario, iva_tipo, iva_monto) FROM stdin;
\.


--
-- TOC entry 5472 (class 0 OID 31196)
-- Dependencies: 237
-- Data for Name: productos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.productos (id, nombre, descripcion, categoria_id, unidad_medida_id, precio_referencia, codigo_interno, codigo_barra, iva_tipo, costo_promedio) FROM stdin;
\.


--
-- TOC entry 5488 (class 0 OID 31327)
-- Dependencies: 253
-- Data for Name: proveedores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.proveedores (id, nombre, ruc, direccion, telefono, email) FROM stdin;
\.


--
-- TOC entry 5564 (class 0 OID 32015)
-- Dependencies: 329
-- Data for Name: recaudaciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.recaudaciones (id, sesion_id, fecha_deposito, banco_id, monto, forma_pago_id, observaciones, usuario_id) FROM stdin;
\.


--
-- TOC entry 5504 (class 0 OID 31506)
-- Dependencies: 269
-- Data for Name: recepcion_equipos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.recepcion_equipos (id, cliente_id, fecha_recepcion, descripcion_equipo, observaciones, usuario_id) FROM stdin;
\.


--
-- TOC entry 5522 (class 0 OID 31646)
-- Dependencies: 287
-- Data for Name: reclamos_servicio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reclamos_servicio (id, cliente_id, fecha, descripcion, estado, referencia_servicio_id, usuario_id) FROM stdin;
\.


--
-- TOC entry 5518 (class 0 OID 31618)
-- Dependencies: 283
-- Data for Name: retiros_equipos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.retiros_equipos (id, recepcion_id, fecha_retiro, entregado_por, retirado_por, observaciones, usuario_id) FROM stdin;
\.


--
-- TOC entry 5455 (class 0 OID 31064)
-- Dependencies: 220
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (id, nombre) FROM stdin;
\.


--
-- TOC entry 5462 (class 0 OID 31126)
-- Dependencies: 227
-- Data for Name: roles_permisos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles_permisos (rol_id, permiso_id) FROM stdin;
\.


--
-- TOC entry 5516 (class 0 OID 31601)
-- Dependencies: 281
-- Data for Name: servicios_insumos_utilizados; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.servicios_insumos_utilizados (id, servicio_id, producto_id, cantidad) FROM stdin;
\.


--
-- TOC entry 5514 (class 0 OID 31582)
-- Dependencies: 279
-- Data for Name: servicios_realizados; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.servicios_realizados (id, orden_id, tecnico_id, descripcion, fecha_inicio, fecha_fin, costo_total, usuario_id) FROM stdin;
\.


--
-- TOC entry 5554 (class 0 OID 31938)
-- Dependencies: 319
-- Data for Name: sesiones_caja; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sesiones_caja (id, usuario_id, caja_id, fecha_apertura, fecha_cierre, estado) FROM stdin;
\.


--
-- TOC entry 5482 (class 0 OID 31262)
-- Dependencies: 247
-- Data for Name: stock_actual; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stock_actual (id, producto_id, deposito_id, cantidad_actual) FROM stdin;
\.


--
-- TOC entry 5484 (class 0 OID 31279)
-- Dependencies: 249
-- Data for Name: stock_movimientos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stock_movimientos (id, producto_id, tipo_movimiento, cantidad, fecha, motivo, deposito_id, referencia_id, modulo_origen, usuario_id) FROM stdin;
\.


--
-- TOC entry 5466 (class 0 OID 31156)
-- Dependencies: 231
-- Data for Name: sucursales; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sucursales (id, nombre, direccion, empresa_id) FROM stdin;
\.


--
-- TOC entry 5478 (class 0 OID 31236)
-- Dependencies: 243
-- Data for Name: tarjetas_bancarias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tarjetas_bancarias (id, banco_id, tipo, nombre_comercial) FROM stdin;
\.


--
-- TOC entry 5590 (class 0 OID 33621)
-- Dependencies: 355
-- Data for Name: tipos_documento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tipos_documento (id, nombre) FROM stdin;
\.


--
-- TOC entry 5486 (class 0 OID 31298)
-- Dependencies: 251
-- Data for Name: transferencias_stock; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transferencias_stock (id, producto_id, deposito_origen_id, deposito_destino_id, cantidad, fecha, motivo, usuario_id) FROM stdin;
\.


--
-- TOC entry 5470 (class 0 OID 31189)
-- Dependencies: 235
-- Data for Name: unidades_medida; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.unidades_medida (id, nombre, simbolo) FROM stdin;
\.


--
-- TOC entry 5459 (class 0 OID 31080)
-- Dependencies: 224
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuarios (id, nombre, email, password_hash, activo, empresa_id) FROM stdin;
\.


--
-- TOC entry 5461 (class 0 OID 31111)
-- Dependencies: 226
-- Data for Name: usuarios_permisos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuarios_permisos (usuario_id, permiso_id) FROM stdin;
\.


--
-- TOC entry 5460 (class 0 OID 31096)
-- Dependencies: 225
-- Data for Name: usuarios_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuarios_roles (usuario_id, rol_id) FROM stdin;
\.


--
-- TOC entry 5468 (class 0 OID 31170)
-- Dependencies: 233
-- Data for Name: vehiculos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vehiculos (id, matricula, marca, modelo, capacidad, sucursal_id) FROM stdin;
\.


--
-- TOC entry 5532 (class 0 OID 31723)
-- Dependencies: 297
-- Data for Name: ventas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ventas (id, cliente_id, fecha_venta, tipo_documento_id, total, estado, presupuesto_id, pedido_id, usuario_id) FROM stdin;
\.


--
-- TOC entry 5656 (class 0 OID 0)
-- Dependencies: 320
-- Name: apertura_caja_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.apertura_caja_id_seq', 1, false);


--
-- TOC entry 5657 (class 0 OID 0)
-- Dependencies: 326
-- Name: arqueo_caja_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.arqueo_caja_id_seq', 1, false);


--
-- TOC entry 5658 (class 0 OID 0)
-- Dependencies: 330
-- Name: auditoria_movimientos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auditoria_movimientos_id_seq', 1, false);


--
-- TOC entry 5659 (class 0 OID 0)
-- Dependencies: 240
-- Name: bancos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bancos_id_seq', 1, false);


--
-- TOC entry 5660 (class 0 OID 0)
-- Dependencies: 316
-- Name: cajas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cajas_id_seq', 1, false);


--
-- TOC entry 5661 (class 0 OID 0)
-- Dependencies: 340
-- Name: categorias_productos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categorias_productos_id_seq', 1, false);


--
-- TOC entry 5662 (class 0 OID 0)
-- Dependencies: 322
-- Name: cierre_caja_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cierre_caja_id_seq', 1, false);


--
-- TOC entry 5663 (class 0 OID 0)
-- Dependencies: 342
-- Name: clientes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clientes_id_seq', 1, false);


--
-- TOC entry 5664 (class 0 OID 0)
-- Dependencies: 310
-- Name: cobros_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cobros_id_seq', 1, false);


--
-- TOC entry 5665 (class 0 OID 0)
-- Dependencies: 256
-- Name: compras_detalles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.compras_detalles_id_seq', 1, false);


--
-- TOC entry 5666 (class 0 OID 0)
-- Dependencies: 254
-- Name: compras_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.compras_id_seq', 1, false);


--
-- TOC entry 5667 (class 0 OID 0)
-- Dependencies: 314
-- Name: comprobantes_pago_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comprobantes_pago_id_seq', 1, false);


--
-- TOC entry 5668 (class 0 OID 0)
-- Dependencies: 338
-- Name: configuracion_timbrados_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.configuracion_timbrados_id_seq', 1, false);


--
-- TOC entry 5669 (class 0 OID 0)
-- Dependencies: 258
-- Name: cuentas_por_pagar_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cuentas_por_pagar_id_seq', 1, false);


--
-- TOC entry 5670 (class 0 OID 0)
-- Dependencies: 260
-- Name: cuentas_por_pagar_pagos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cuentas_por_pagar_pagos_id_seq', 1, false);


--
-- TOC entry 5671 (class 0 OID 0)
-- Dependencies: 244
-- Name: depositos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.depositos_id_seq', 1, false);


--
-- TOC entry 5672 (class 0 OID 0)
-- Dependencies: 312
-- Name: detalle_cobros_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.detalle_cobros_id_seq', 1, false);


--
-- TOC entry 5673 (class 0 OID 0)
-- Dependencies: 306
-- Name: detalle_facturas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.detalle_facturas_id_seq', 1, false);


--
-- TOC entry 5674 (class 0 OID 0)
-- Dependencies: 344
-- Name: detalle_servicio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.detalle_servicio_id_seq', 1, false);


--
-- TOC entry 5675 (class 0 OID 0)
-- Dependencies: 298
-- Name: detalle_ventas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.detalle_ventas_id_seq', 1, false);


--
-- TOC entry 5676 (class 0 OID 0)
-- Dependencies: 270
-- Name: diagnosticos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.diagnosticos_id_seq', 1, false);


--
-- TOC entry 5677 (class 0 OID 0)
-- Dependencies: 217
-- Name: empresa_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.empresa_id_seq', 1, false);


--
-- TOC entry 5678 (class 0 OID 0)
-- Dependencies: 304
-- Name: facturas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.facturas_id_seq', 1, false);


--
-- TOC entry 5679 (class 0 OID 0)
-- Dependencies: 238
-- Name: formas_pago_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.formas_pago_id_seq', 1, false);


--
-- TOC entry 5680 (class 0 OID 0)
-- Dependencies: 284
-- Name: garantias_servicio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.garantias_servicio_id_seq', 1, false);


--
-- TOC entry 5681 (class 0 OID 0)
-- Dependencies: 334
-- Name: historial_accesos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.historial_accesos_id_seq', 1, false);


--
-- TOC entry 5682 (class 0 OID 0)
-- Dependencies: 262
-- Name: libro_iva_compras_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.libro_iva_compras_id_seq', 1, false);


--
-- TOC entry 5683 (class 0 OID 0)
-- Dependencies: 336
-- Name: libro_iva_ventas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.libro_iva_ventas_id_seq', 1, false);


--
-- TOC entry 5684 (class 0 OID 0)
-- Dependencies: 332
-- Name: log_errores_sistema_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.log_errores_sistema_id_seq', 1, false);


--
-- TOC entry 5685 (class 0 OID 0)
-- Dependencies: 324
-- Name: movimientos_caja_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.movimientos_caja_id_seq', 1, false);


--
-- TOC entry 5686 (class 0 OID 0)
-- Dependencies: 266
-- Name: notas_credito_debito_compra_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.notas_credito_debito_compra_id_seq', 1, false);


--
-- TOC entry 5687 (class 0 OID 0)
-- Dependencies: 308
-- Name: notas_credito_debito_venta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.notas_credito_debito_venta_id_seq', 1, false);


--
-- TOC entry 5688 (class 0 OID 0)
-- Dependencies: 264
-- Name: notas_remision_compra_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.notas_remision_compra_id_seq', 1, false);


--
-- TOC entry 5689 (class 0 OID 0)
-- Dependencies: 302
-- Name: notas_remision_detalles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.notas_remision_detalles_id_seq', 1, false);


--
-- TOC entry 5690 (class 0 OID 0)
-- Dependencies: 300
-- Name: notas_remision_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.notas_remision_id_seq', 1, false);


--
-- TOC entry 5691 (class 0 OID 0)
-- Dependencies: 348
-- Name: ordenes_compra_detalles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ordenes_compra_detalles_id_seq', 1, false);


--
-- TOC entry 5692 (class 0 OID 0)
-- Dependencies: 346
-- Name: ordenes_compra_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ordenes_compra_id_seq', 1, false);


--
-- TOC entry 5693 (class 0 OID 0)
-- Dependencies: 276
-- Name: ordenes_servicio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ordenes_servicio_id_seq', 1, false);


--
-- TOC entry 5694 (class 0 OID 0)
-- Dependencies: 352
-- Name: pedidos_compra_detalles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pedidos_compra_detalles_id_seq', 1, false);


--
-- TOC entry 5695 (class 0 OID 0)
-- Dependencies: 350
-- Name: pedidos_compra_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pedidos_compra_id_seq', 1, false);


--
-- TOC entry 5696 (class 0 OID 0)
-- Dependencies: 294
-- Name: pedidos_venta_detalles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pedidos_venta_detalles_id_seq', 1, false);


--
-- TOC entry 5697 (class 0 OID 0)
-- Dependencies: 292
-- Name: pedidos_venta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pedidos_venta_id_seq', 1, false);


--
-- TOC entry 5698 (class 0 OID 0)
-- Dependencies: 221
-- Name: permisos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.permisos_id_seq', 1, false);


--
-- TOC entry 5699 (class 0 OID 0)
-- Dependencies: 228
-- Name: personal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personal_id_seq', 1, false);


--
-- TOC entry 5700 (class 0 OID 0)
-- Dependencies: 274
-- Name: presupuestos_servicio_detalles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.presupuestos_servicio_detalles_id_seq', 1, false);


--
-- TOC entry 5701 (class 0 OID 0)
-- Dependencies: 272
-- Name: presupuestos_servicio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.presupuestos_servicio_id_seq', 1, false);


--
-- TOC entry 5702 (class 0 OID 0)
-- Dependencies: 290
-- Name: presupuestos_venta_detalles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.presupuestos_venta_detalles_id_seq', 1, false);


--
-- TOC entry 5703 (class 0 OID 0)
-- Dependencies: 288
-- Name: presupuestos_venta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.presupuestos_venta_id_seq', 1, false);


--
-- TOC entry 5704 (class 0 OID 0)
-- Dependencies: 236
-- Name: productos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.productos_id_seq', 1, false);


--
-- TOC entry 5705 (class 0 OID 0)
-- Dependencies: 252
-- Name: proveedores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.proveedores_id_seq', 1, false);


--
-- TOC entry 5706 (class 0 OID 0)
-- Dependencies: 328
-- Name: recaudaciones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.recaudaciones_id_seq', 1, false);


--
-- TOC entry 5707 (class 0 OID 0)
-- Dependencies: 268
-- Name: recepcion_equipos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.recepcion_equipos_id_seq', 1, false);


--
-- TOC entry 5708 (class 0 OID 0)
-- Dependencies: 286
-- Name: reclamos_servicio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reclamos_servicio_id_seq', 1, false);


--
-- TOC entry 5709 (class 0 OID 0)
-- Dependencies: 282
-- Name: retiros_equipos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.retiros_equipos_id_seq', 1, false);


--
-- TOC entry 5710 (class 0 OID 0)
-- Dependencies: 219
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_seq', 1, false);


--
-- TOC entry 5711 (class 0 OID 0)
-- Dependencies: 280
-- Name: servicios_insumos_utilizados_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.servicios_insumos_utilizados_id_seq', 1, false);


--
-- TOC entry 5712 (class 0 OID 0)
-- Dependencies: 278
-- Name: servicios_realizados_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.servicios_realizados_id_seq', 1, false);


--
-- TOC entry 5713 (class 0 OID 0)
-- Dependencies: 318
-- Name: sesiones_caja_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sesiones_caja_id_seq', 1, false);


--
-- TOC entry 5714 (class 0 OID 0)
-- Dependencies: 246
-- Name: stock_actual_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stock_actual_id_seq', 1, false);


--
-- TOC entry 5715 (class 0 OID 0)
-- Dependencies: 248
-- Name: stock_movimientos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stock_movimientos_id_seq', 1, false);


--
-- TOC entry 5716 (class 0 OID 0)
-- Dependencies: 230
-- Name: sucursales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sucursales_id_seq', 1, false);


--
-- TOC entry 5717 (class 0 OID 0)
-- Dependencies: 242
-- Name: tarjetas_bancarias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tarjetas_bancarias_id_seq', 1, false);


--
-- TOC entry 5718 (class 0 OID 0)
-- Dependencies: 354
-- Name: tipos_documento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipos_documento_id_seq', 1, false);


--
-- TOC entry 5719 (class 0 OID 0)
-- Dependencies: 250
-- Name: transferencias_stock_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transferencias_stock_id_seq', 1, false);


--
-- TOC entry 5720 (class 0 OID 0)
-- Dependencies: 234
-- Name: unidades_medida_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.unidades_medida_id_seq', 1, false);


--
-- TOC entry 5721 (class 0 OID 0)
-- Dependencies: 223
-- Name: usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_id_seq', 1, false);


--
-- TOC entry 5722 (class 0 OID 0)
-- Dependencies: 232
-- Name: vehiculos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vehiculos_id_seq', 1, false);


--
-- TOC entry 5723 (class 0 OID 0)
-- Dependencies: 296
-- Name: ventas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ventas_id_seq', 1, false);


--
-- TOC entry 5161 (class 2606 OID 31960)
-- Name: apertura_caja apertura_caja_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.apertura_caja
    ADD CONSTRAINT apertura_caja_pkey PRIMARY KEY (id);


--
-- TOC entry 5167 (class 2606 OID 32008)
-- Name: arqueo_caja arqueo_caja_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.arqueo_caja
    ADD CONSTRAINT arqueo_caja_pkey PRIMARY KEY (id);


--
-- TOC entry 5172 (class 2606 OID 32047)
-- Name: auditoria_movimientos auditoria_movimientos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auditoria_movimientos
    ADD CONSTRAINT auditoria_movimientos_pkey PRIMARY KEY (id);


--
-- TOC entry 5065 (class 2606 OID 31234)
-- Name: bancos bancos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bancos
    ADD CONSTRAINT bancos_pkey PRIMARY KEY (id);


--
-- TOC entry 5157 (class 2606 OID 31931)
-- Name: cajas cajas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cajas
    ADD CONSTRAINT cajas_pkey PRIMARY KEY (id);


--
-- TOC entry 5182 (class 2606 OID 33539)
-- Name: categorias_productos categorias_productos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorias_productos
    ADD CONSTRAINT categorias_productos_pkey PRIMARY KEY (id);


--
-- TOC entry 5163 (class 2606 OID 31972)
-- Name: cierre_caja cierre_caja_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cierre_caja
    ADD CONSTRAINT cierre_caja_pkey PRIMARY KEY (id);


--
-- TOC entry 5184 (class 2606 OID 33547)
-- Name: clientes clientes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id);


--
-- TOC entry 5150 (class 2606 OID 31878)
-- Name: cobros cobros_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cobros
    ADD CONSTRAINT cobros_pkey PRIMARY KEY (id);


--
-- TOC entry 5084 (class 2606 OID 31420)
-- Name: compras_detalles compras_detalles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compras_detalles
    ADD CONSTRAINT compras_detalles_pkey PRIMARY KEY (id);


--
-- TOC entry 5080 (class 2606 OID 31403)
-- Name: compras compras_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compras
    ADD CONSTRAINT compras_pkey PRIMARY KEY (id);


--
-- TOC entry 5155 (class 2606 OID 31912)
-- Name: comprobantes_pago comprobantes_pago_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comprobantes_pago
    ADD CONSTRAINT comprobantes_pago_pkey PRIMARY KEY (id);


--
-- TOC entry 5180 (class 2606 OID 32132)
-- Name: configuracion_timbrados configuracion_timbrados_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.configuracion_timbrados
    ADD CONSTRAINT configuracion_timbrados_pkey PRIMARY KEY (id);


--
-- TOC entry 5088 (class 2606 OID 31449)
-- Name: cuentas_por_pagar_pagos cuentas_por_pagar_pagos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuentas_por_pagar_pagos
    ADD CONSTRAINT cuentas_por_pagar_pagos_pkey PRIMARY KEY (id);


--
-- TOC entry 5086 (class 2606 OID 31437)
-- Name: cuentas_por_pagar cuentas_por_pagar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuentas_por_pagar
    ADD CONSTRAINT cuentas_por_pagar_pkey PRIMARY KEY (id);


--
-- TOC entry 5069 (class 2606 OID 31255)
-- Name: depositos depositos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.depositos
    ADD CONSTRAINT depositos_pkey PRIMARY KEY (id);


--
-- TOC entry 5153 (class 2606 OID 31890)
-- Name: detalle_cobros detalle_cobros_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_cobros
    ADD CONSTRAINT detalle_cobros_pkey PRIMARY KEY (id);


--
-- TOC entry 5146 (class 2606 OID 31835)
-- Name: detalle_facturas detalle_facturas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_facturas
    ADD CONSTRAINT detalle_facturas_pkey PRIMARY KEY (id);


--
-- TOC entry 5186 (class 2606 OID 33565)
-- Name: detalle_servicio detalle_servicio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_servicio
    ADD CONSTRAINT detalle_servicio_pkey PRIMARY KEY (id);


--
-- TOC entry 5137 (class 2606 OID 31745)
-- Name: detalle_ventas detalle_ventas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_ventas
    ADD CONSTRAINT detalle_ventas_pkey PRIMARY KEY (id);


--
-- TOC entry 5099 (class 2606 OID 31527)
-- Name: diagnosticos diagnosticos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.diagnosticos
    ADD CONSTRAINT diagnosticos_pkey PRIMARY KEY (id);


--
-- TOC entry 5037 (class 2606 OID 31062)
-- Name: empresa empresa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empresa
    ADD CONSTRAINT empresa_pkey PRIMARY KEY (id);


--
-- TOC entry 5143 (class 2606 OID 31813)
-- Name: facturas facturas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facturas
    ADD CONSTRAINT facturas_pkey PRIMARY KEY (id);


--
-- TOC entry 5063 (class 2606 OID 31220)
-- Name: formas_pago formas_pago_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.formas_pago
    ADD CONSTRAINT formas_pago_pkey PRIMARY KEY (id);


--
-- TOC entry 5118 (class 2606 OID 31639)
-- Name: garantias_servicio garantias_servicio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.garantias_servicio
    ADD CONSTRAINT garantias_servicio_pkey PRIMARY KEY (id);


--
-- TOC entry 5176 (class 2606 OID 32070)
-- Name: historial_accesos historial_accesos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historial_accesos
    ADD CONSTRAINT historial_accesos_pkey PRIMARY KEY (id);


--
-- TOC entry 5090 (class 2606 OID 31471)
-- Name: libro_iva_compras libro_iva_compras_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libro_iva_compras
    ADD CONSTRAINT libro_iva_compras_pkey PRIMARY KEY (id);


--
-- TOC entry 5178 (class 2606 OID 32093)
-- Name: libro_iva_ventas libro_iva_ventas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libro_iva_ventas
    ADD CONSTRAINT libro_iva_ventas_pkey PRIMARY KEY (id);


--
-- TOC entry 5174 (class 2606 OID 32062)
-- Name: log_errores_sistema log_errores_sistema_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.log_errores_sistema
    ADD CONSTRAINT log_errores_sistema_pkey PRIMARY KEY (id);


--
-- TOC entry 5165 (class 2606 OID 31984)
-- Name: movimientos_caja movimientos_caja_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movimientos_caja
    ADD CONSTRAINT movimientos_caja_pkey PRIMARY KEY (id);


--
-- TOC entry 5094 (class 2606 OID 31499)
-- Name: notas_credito_debito_compra notas_credito_debito_compra_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notas_credito_debito_compra
    ADD CONSTRAINT notas_credito_debito_compra_pkey PRIMARY KEY (id);


--
-- TOC entry 5148 (class 2606 OID 31866)
-- Name: notas_credito_debito_venta notas_credito_debito_venta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notas_credito_debito_venta
    ADD CONSTRAINT notas_credito_debito_venta_pkey PRIMARY KEY (id);


--
-- TOC entry 5092 (class 2606 OID 31485)
-- Name: notas_remision_compra notas_remision_compra_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notas_remision_compra
    ADD CONSTRAINT notas_remision_compra_pkey PRIMARY KEY (id);


--
-- TOC entry 5141 (class 2606 OID 31796)
-- Name: notas_remision_detalles notas_remision_detalles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notas_remision_detalles
    ADD CONSTRAINT notas_remision_detalles_pkey PRIMARY KEY (id);


--
-- TOC entry 5139 (class 2606 OID 31764)
-- Name: notas_remision notas_remision_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notas_remision
    ADD CONSTRAINT notas_remision_pkey PRIMARY KEY (id);


--
-- TOC entry 5191 (class 2606 OID 33577)
-- Name: ordenes_compra_detalles ordenes_compra_detalles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ordenes_compra_detalles
    ADD CONSTRAINT ordenes_compra_detalles_pkey PRIMARY KEY (id);


--
-- TOC entry 5189 (class 2606 OID 33571)
-- Name: ordenes_compra ordenes_compra_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ordenes_compra
    ADD CONSTRAINT ordenes_compra_pkey PRIMARY KEY (id);


--
-- TOC entry 5108 (class 2606 OID 31575)
-- Name: ordenes_servicio ordenes_servicio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ordenes_servicio
    ADD CONSTRAINT ordenes_servicio_pkey PRIMARY KEY (id);


--
-- TOC entry 5196 (class 2606 OID 33589)
-- Name: pedidos_compra_detalles pedidos_compra_detalles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos_compra_detalles
    ADD CONSTRAINT pedidos_compra_detalles_pkey PRIMARY KEY (id);


--
-- TOC entry 5194 (class 2606 OID 33583)
-- Name: pedidos_compra pedidos_compra_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos_compra
    ADD CONSTRAINT pedidos_compra_pkey PRIMARY KEY (id);


--
-- TOC entry 5132 (class 2606 OID 31711)
-- Name: pedidos_venta_detalles pedidos_venta_detalles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos_venta_detalles
    ADD CONSTRAINT pedidos_venta_detalles_pkey PRIMARY KEY (id);


--
-- TOC entry 5130 (class 2606 OID 31699)
-- Name: pedidos_venta pedidos_venta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos_venta
    ADD CONSTRAINT pedidos_venta_pkey PRIMARY KEY (id);


--
-- TOC entry 5041 (class 2606 OID 31078)
-- Name: permisos permisos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permisos
    ADD CONSTRAINT permisos_pkey PRIMARY KEY (id);


--
-- TOC entry 5053 (class 2606 OID 31149)
-- Name: personal personal_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal
    ADD CONSTRAINT personal_pkey PRIMARY KEY (id);


--
-- TOC entry 5105 (class 2606 OID 31558)
-- Name: presupuestos_servicio_detalles presupuestos_servicio_detalles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.presupuestos_servicio_detalles
    ADD CONSTRAINT presupuestos_servicio_detalles_pkey PRIMARY KEY (id);


--
-- TOC entry 5103 (class 2606 OID 31544)
-- Name: presupuestos_servicio presupuestos_servicio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.presupuestos_servicio
    ADD CONSTRAINT presupuestos_servicio_pkey PRIMARY KEY (id);


--
-- TOC entry 5127 (class 2606 OID 31682)
-- Name: presupuestos_venta_detalles presupuestos_venta_detalles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.presupuestos_venta_detalles
    ADD CONSTRAINT presupuestos_venta_detalles_pkey PRIMARY KEY (id);


--
-- TOC entry 5125 (class 2606 OID 31670)
-- Name: presupuestos_venta presupuestos_venta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.presupuestos_venta
    ADD CONSTRAINT presupuestos_venta_pkey PRIMARY KEY (id);


--
-- TOC entry 5061 (class 2606 OID 31203)
-- Name: productos productos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_pkey PRIMARY KEY (id);


--
-- TOC entry 5078 (class 2606 OID 31334)
-- Name: proveedores proveedores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proveedores
    ADD CONSTRAINT proveedores_pkey PRIMARY KEY (id);


--
-- TOC entry 5170 (class 2606 OID 32022)
-- Name: recaudaciones recaudaciones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recaudaciones
    ADD CONSTRAINT recaudaciones_pkey PRIMARY KEY (id);


--
-- TOC entry 5097 (class 2606 OID 31513)
-- Name: recepcion_equipos recepcion_equipos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recepcion_equipos
    ADD CONSTRAINT recepcion_equipos_pkey PRIMARY KEY (id);


--
-- TOC entry 5122 (class 2606 OID 31653)
-- Name: reclamos_servicio reclamos_servicio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reclamos_servicio
    ADD CONSTRAINT reclamos_servicio_pkey PRIMARY KEY (id);


--
-- TOC entry 5116 (class 2606 OID 31625)
-- Name: retiros_equipos retiros_equipos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.retiros_equipos
    ADD CONSTRAINT retiros_equipos_pkey PRIMARY KEY (id);


--
-- TOC entry 5051 (class 2606 OID 31130)
-- Name: roles_permisos roles_permisos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles_permisos
    ADD CONSTRAINT roles_permisos_pkey PRIMARY KEY (rol_id, permiso_id);


--
-- TOC entry 5039 (class 2606 OID 31069)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- TOC entry 5113 (class 2606 OID 31606)
-- Name: servicios_insumos_utilizados servicios_insumos_utilizados_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servicios_insumos_utilizados
    ADD CONSTRAINT servicios_insumos_utilizados_pkey PRIMARY KEY (id);


--
-- TOC entry 5111 (class 2606 OID 31589)
-- Name: servicios_realizados servicios_realizados_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servicios_realizados
    ADD CONSTRAINT servicios_realizados_pkey PRIMARY KEY (id);


--
-- TOC entry 5159 (class 2606 OID 31943)
-- Name: sesiones_caja sesiones_caja_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sesiones_caja
    ADD CONSTRAINT sesiones_caja_pkey PRIMARY KEY (id);


--
-- TOC entry 5071 (class 2606 OID 31267)
-- Name: stock_actual stock_actual_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock_actual
    ADD CONSTRAINT stock_actual_pkey PRIMARY KEY (id);


--
-- TOC entry 5074 (class 2606 OID 31286)
-- Name: stock_movimientos stock_movimientos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock_movimientos
    ADD CONSTRAINT stock_movimientos_pkey PRIMARY KEY (id);


--
-- TOC entry 5055 (class 2606 OID 31163)
-- Name: sucursales sucursales_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sucursales
    ADD CONSTRAINT sucursales_pkey PRIMARY KEY (id);


--
-- TOC entry 5067 (class 2606 OID 31241)
-- Name: tarjetas_bancarias tarjetas_bancarias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tarjetas_bancarias
    ADD CONSTRAINT tarjetas_bancarias_pkey PRIMARY KEY (id);


--
-- TOC entry 5198 (class 2606 OID 33625)
-- Name: tipos_documento tipos_documento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipos_documento
    ADD CONSTRAINT tipos_documento_pkey PRIMARY KEY (id);


--
-- TOC entry 5076 (class 2606 OID 31305)
-- Name: transferencias_stock transferencias_stock_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transferencias_stock
    ADD CONSTRAINT transferencias_stock_pkey PRIMARY KEY (id);


--
-- TOC entry 5059 (class 2606 OID 31194)
-- Name: unidades_medida unidades_medida_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unidades_medida
    ADD CONSTRAINT unidades_medida_pkey PRIMARY KEY (id);


--
-- TOC entry 5043 (class 2606 OID 31090)
-- Name: usuarios usuarios_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key UNIQUE (email);


--
-- TOC entry 5049 (class 2606 OID 31115)
-- Name: usuarios_permisos usuarios_permisos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios_permisos
    ADD CONSTRAINT usuarios_permisos_pkey PRIMARY KEY (usuario_id, permiso_id);


--
-- TOC entry 5045 (class 2606 OID 31088)
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- TOC entry 5047 (class 2606 OID 31100)
-- Name: usuarios_roles usuarios_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios_roles
    ADD CONSTRAINT usuarios_roles_pkey PRIMARY KEY (usuario_id, rol_id);


--
-- TOC entry 5057 (class 2606 OID 31175)
-- Name: vehiculos vehiculos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehiculos
    ADD CONSTRAINT vehiculos_pkey PRIMARY KEY (id);


--
-- TOC entry 5135 (class 2606 OID 31728)
-- Name: ventas ventas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ventas
    ADD CONSTRAINT ventas_pkey PRIMARY KEY (id);


--
-- TOC entry 5151 (class 1259 OID 33744)
-- Name: idx_cobros_usuario_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_cobros_usuario_id ON public.cobros USING btree (usuario_id);


--
-- TOC entry 5081 (class 1259 OID 32159)
-- Name: idx_compras_orden_compra_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_compras_orden_compra_id ON public.compras USING btree (orden_compra_id);


--
-- TOC entry 5082 (class 1259 OID 33816)
-- Name: idx_compras_usuario_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_compras_usuario_id ON public.compras USING btree (usuario_id);


--
-- TOC entry 5100 (class 1259 OID 33762)
-- Name: idx_diagnosticos_usuario_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_diagnosticos_usuario_id ON public.diagnosticos USING btree (usuario_id);


--
-- TOC entry 5144 (class 1259 OID 33738)
-- Name: idx_facturas_usuario_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_facturas_usuario_id ON public.facturas USING btree (usuario_id);


--
-- TOC entry 5119 (class 1259 OID 33786)
-- Name: idx_garantias_servicio_usuario_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_garantias_servicio_usuario_id ON public.garantias_servicio USING btree (usuario_id);


--
-- TOC entry 5187 (class 1259 OID 33810)
-- Name: idx_ordenes_compra_usuario_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_ordenes_compra_usuario_id ON public.ordenes_compra USING btree (usuario_id);


--
-- TOC entry 5106 (class 1259 OID 33774)
-- Name: idx_ordenes_servicio_usuario_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_ordenes_servicio_usuario_id ON public.ordenes_servicio USING btree (usuario_id);


--
-- TOC entry 5192 (class 1259 OID 33804)
-- Name: idx_pedidos_compra_usuario_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_pedidos_compra_usuario_id ON public.pedidos_compra USING btree (usuario_id);


--
-- TOC entry 5128 (class 1259 OID 33726)
-- Name: idx_pedidos_venta_usuario_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_pedidos_venta_usuario_id ON public.pedidos_venta USING btree (usuario_id);


--
-- TOC entry 5101 (class 1259 OID 33768)
-- Name: idx_presupuestos_servicio_usuario_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_presupuestos_servicio_usuario_id ON public.presupuestos_servicio USING btree (usuario_id);


--
-- TOC entry 5123 (class 1259 OID 33720)
-- Name: idx_presupuestos_venta_usuario_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_presupuestos_venta_usuario_id ON public.presupuestos_venta USING btree (usuario_id);


--
-- TOC entry 5168 (class 1259 OID 33750)
-- Name: idx_recaudaciones_usuario_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_recaudaciones_usuario_id ON public.recaudaciones USING btree (usuario_id);


--
-- TOC entry 5095 (class 1259 OID 33756)
-- Name: idx_recepcion_equipos_usuario_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_recepcion_equipos_usuario_id ON public.recepcion_equipos USING btree (usuario_id);


--
-- TOC entry 5120 (class 1259 OID 33792)
-- Name: idx_reclamos_servicio_usuario_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_reclamos_servicio_usuario_id ON public.reclamos_servicio USING btree (usuario_id);


--
-- TOC entry 5114 (class 1259 OID 33798)
-- Name: idx_retiros_equipos_usuario_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_retiros_equipos_usuario_id ON public.retiros_equipos USING btree (usuario_id);


--
-- TOC entry 5109 (class 1259 OID 33780)
-- Name: idx_servicios_realizados_usuario_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_servicios_realizados_usuario_id ON public.servicios_realizados USING btree (usuario_id);


--
-- TOC entry 5072 (class 1259 OID 33822)
-- Name: idx_stock_movimientos_usuario_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_stock_movimientos_usuario_id ON public.stock_movimientos USING btree (usuario_id);


--
-- TOC entry 5133 (class 1259 OID 33732)
-- Name: idx_ventas_usuario_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_ventas_usuario_id ON public.ventas USING btree (usuario_id);


--
-- TOC entry 5288 (class 2606 OID 31961)
-- Name: apertura_caja apertura_caja_sesion_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.apertura_caja
    ADD CONSTRAINT apertura_caja_sesion_id_fkey FOREIGN KEY (sesion_id) REFERENCES public.sesiones_caja(id);


--
-- TOC entry 5293 (class 2606 OID 32009)
-- Name: arqueo_caja arqueo_caja_sesion_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.arqueo_caja
    ADD CONSTRAINT arqueo_caja_sesion_id_fkey FOREIGN KEY (sesion_id) REFERENCES public.sesiones_caja(id);


--
-- TOC entry 5298 (class 2606 OID 32048)
-- Name: auditoria_movimientos auditoria_movimientos_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auditoria_movimientos
    ADD CONSTRAINT auditoria_movimientos_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id);


--
-- TOC entry 5285 (class 2606 OID 31932)
-- Name: cajas cajas_sucursal_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cajas
    ADD CONSTRAINT cajas_sucursal_id_fkey FOREIGN KEY (sucursal_id) REFERENCES public.sucursales(id);


--
-- TOC entry 5289 (class 2606 OID 31973)
-- Name: cierre_caja cierre_caja_sesion_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cierre_caja
    ADD CONSTRAINT cierre_caja_sesion_id_fkey FOREIGN KEY (sesion_id) REFERENCES public.sesiones_caja(id);


--
-- TOC entry 5278 (class 2606 OID 31879)
-- Name: cobros cobros_venta_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cobros
    ADD CONSTRAINT cobros_venta_id_fkey FOREIGN KEY (venta_id) REFERENCES public.ventas(id);


--
-- TOC entry 5223 (class 2606 OID 31421)
-- Name: compras_detalles compras_detalles_compra_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compras_detalles
    ADD CONSTRAINT compras_detalles_compra_id_fkey FOREIGN KEY (compra_id) REFERENCES public.compras(id);


--
-- TOC entry 5224 (class 2606 OID 31426)
-- Name: compras_detalles compras_detalles_producto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compras_detalles
    ADD CONSTRAINT compras_detalles_producto_id_fkey FOREIGN KEY (producto_id) REFERENCES public.productos(id);


--
-- TOC entry 5221 (class 2606 OID 31404)
-- Name: compras compras_proveedor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compras
    ADD CONSTRAINT compras_proveedor_id_fkey FOREIGN KEY (proveedor_id) REFERENCES public.proveedores(id);


--
-- TOC entry 5284 (class 2606 OID 31913)
-- Name: comprobantes_pago comprobantes_pago_cobro_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comprobantes_pago
    ADD CONSTRAINT comprobantes_pago_cobro_id_fkey FOREIGN KEY (cobro_id) REFERENCES public.cobros(id);


--
-- TOC entry 5301 (class 2606 OID 32133)
-- Name: configuracion_timbrados configuracion_timbrados_sucursal_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.configuracion_timbrados
    ADD CONSTRAINT configuracion_timbrados_sucursal_id_fkey FOREIGN KEY (sucursal_id) REFERENCES public.sucursales(id);


--
-- TOC entry 5225 (class 2606 OID 31438)
-- Name: cuentas_por_pagar cuentas_por_pagar_compra_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuentas_por_pagar
    ADD CONSTRAINT cuentas_por_pagar_compra_id_fkey FOREIGN KEY (compra_id) REFERENCES public.compras(id);


--
-- TOC entry 5226 (class 2606 OID 31460)
-- Name: cuentas_por_pagar_pagos cuentas_por_pagar_pagos_banco_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuentas_por_pagar_pagos
    ADD CONSTRAINT cuentas_por_pagar_pagos_banco_id_fkey FOREIGN KEY (banco_id) REFERENCES public.bancos(id);


--
-- TOC entry 5227 (class 2606 OID 31450)
-- Name: cuentas_por_pagar_pagos cuentas_por_pagar_pagos_cuenta_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuentas_por_pagar_pagos
    ADD CONSTRAINT cuentas_por_pagar_pagos_cuenta_id_fkey FOREIGN KEY (cuenta_id) REFERENCES public.cuentas_por_pagar(id);


--
-- TOC entry 5228 (class 2606 OID 31455)
-- Name: cuentas_por_pagar_pagos cuentas_por_pagar_pagos_forma_pago_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuentas_por_pagar_pagos
    ADD CONSTRAINT cuentas_por_pagar_pagos_forma_pago_id_fkey FOREIGN KEY (forma_pago_id) REFERENCES public.formas_pago(id);


--
-- TOC entry 5211 (class 2606 OID 31256)
-- Name: depositos depositos_sucursal_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.depositos
    ADD CONSTRAINT depositos_sucursal_id_fkey FOREIGN KEY (sucursal_id) REFERENCES public.sucursales(id);


--
-- TOC entry 5281 (class 2606 OID 31901)
-- Name: detalle_cobros detalle_cobros_banco_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_cobros
    ADD CONSTRAINT detalle_cobros_banco_id_fkey FOREIGN KEY (banco_id) REFERENCES public.bancos(id);


--
-- TOC entry 5282 (class 2606 OID 31891)
-- Name: detalle_cobros detalle_cobros_cobro_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_cobros
    ADD CONSTRAINT detalle_cobros_cobro_id_fkey FOREIGN KEY (cobro_id) REFERENCES public.cobros(id);


--
-- TOC entry 5283 (class 2606 OID 31896)
-- Name: detalle_cobros detalle_cobros_forma_pago_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_cobros
    ADD CONSTRAINT detalle_cobros_forma_pago_id_fkey FOREIGN KEY (forma_pago_id) REFERENCES public.formas_pago(id);


--
-- TOC entry 5275 (class 2606 OID 31836)
-- Name: detalle_facturas detalle_facturas_factura_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_facturas
    ADD CONSTRAINT detalle_facturas_factura_id_fkey FOREIGN KEY (factura_id) REFERENCES public.facturas(id);


--
-- TOC entry 5276 (class 2606 OID 31841)
-- Name: detalle_facturas detalle_facturas_producto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_facturas
    ADD CONSTRAINT detalle_facturas_producto_id_fkey FOREIGN KEY (producto_id) REFERENCES public.productos(id);


--
-- TOC entry 5264 (class 2606 OID 31751)
-- Name: detalle_ventas detalle_ventas_producto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_ventas
    ADD CONSTRAINT detalle_ventas_producto_id_fkey FOREIGN KEY (producto_id) REFERENCES public.productos(id);


--
-- TOC entry 5265 (class 2606 OID 31746)
-- Name: detalle_ventas detalle_ventas_venta_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_ventas
    ADD CONSTRAINT detalle_ventas_venta_id_fkey FOREIGN KEY (venta_id) REFERENCES public.ventas(id);


--
-- TOC entry 5233 (class 2606 OID 31528)
-- Name: diagnosticos diagnosticos_recepcion_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.diagnosticos
    ADD CONSTRAINT diagnosticos_recepcion_id_fkey FOREIGN KEY (recepcion_id) REFERENCES public.recepcion_equipos(id);


--
-- TOC entry 5234 (class 2606 OID 31533)
-- Name: diagnosticos diagnosticos_tecnico_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.diagnosticos
    ADD CONSTRAINT diagnosticos_tecnico_id_fkey FOREIGN KEY (tecnico_id) REFERENCES public.usuarios(id);


--
-- TOC entry 5272 (class 2606 OID 31814)
-- Name: facturas facturas_venta_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facturas
    ADD CONSTRAINT facturas_venta_id_fkey FOREIGN KEY (venta_id) REFERENCES public.ventas(id);


--
-- TOC entry 5304 (class 2606 OID 33669)
-- Name: ordenes_compra_detalles fk2omqk6a0ae0bobiesk881g9uh; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ordenes_compra_detalles
    ADD CONSTRAINT fk2omqk6a0ae0bobiesk881g9uh FOREIGN KEY (orden_id) REFERENCES public.ordenes_compra(id);


--
-- TOC entry 5279 (class 2606 OID 32082)
-- Name: cobros fk_cobro_servicio; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cobros
    ADD CONSTRAINT fk_cobro_servicio FOREIGN KEY (servicio_id) REFERENCES public.servicios_realizados(id);


--
-- TOC entry 5280 (class 2606 OID 33739)
-- Name: cobros fk_cobros_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cobros
    ADD CONSTRAINT fk_cobros_usuario FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id);


--
-- TOC entry 5222 (class 2606 OID 33811)
-- Name: compras fk_compras_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compras
    ADD CONSTRAINT fk_compras_usuario FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id);


--
-- TOC entry 5235 (class 2606 OID 33757)
-- Name: diagnosticos fk_diagnosticos_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.diagnosticos
    ADD CONSTRAINT fk_diagnosticos_usuario FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id);


--
-- TOC entry 5199 (class 2606 OID 31091)
-- Name: usuarios fk_empresa; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT fk_empresa FOREIGN KEY (empresa_id) REFERENCES public.empresa(id);


--
-- TOC entry 5273 (class 2606 OID 32143)
-- Name: facturas fk_factura_timbrado; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facturas
    ADD CONSTRAINT fk_factura_timbrado FOREIGN KEY (configuracion_timbrado_id) REFERENCES public.configuracion_timbrados(id);


--
-- TOC entry 5274 (class 2606 OID 33733)
-- Name: facturas fk_facturas_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facturas
    ADD CONSTRAINT fk_facturas_usuario FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id);


--
-- TOC entry 5250 (class 2606 OID 33781)
-- Name: garantias_servicio fk_garantias_servicio_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.garantias_servicio
    ADD CONSTRAINT fk_garantias_servicio_usuario FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id);


--
-- TOC entry 5302 (class 2606 OID 33805)
-- Name: ordenes_compra fk_ordenes_compra_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ordenes_compra
    ADD CONSTRAINT fk_ordenes_compra_usuario FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id);


--
-- TOC entry 5241 (class 2606 OID 33769)
-- Name: ordenes_servicio fk_ordenes_servicio_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ordenes_servicio
    ADD CONSTRAINT fk_ordenes_servicio_usuario FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id);


--
-- TOC entry 5305 (class 2606 OID 33799)
-- Name: pedidos_compra fk_pedidos_compra_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos_compra
    ADD CONSTRAINT fk_pedidos_compra_usuario FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id);


--
-- TOC entry 5258 (class 2606 OID 33721)
-- Name: pedidos_venta fk_pedidos_venta_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos_venta
    ADD CONSTRAINT fk_pedidos_venta_usuario FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id);


--
-- TOC entry 5236 (class 2606 OID 32077)
-- Name: presupuestos_servicio fk_presupuesto_diagnostico; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.presupuestos_servicio
    ADD CONSTRAINT fk_presupuesto_diagnostico FOREIGN KEY (diagnostico_id) REFERENCES public.diagnosticos(id);


--
-- TOC entry 5254 (class 2606 OID 32110)
-- Name: presupuestos_venta fk_presupuesto_pedido; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.presupuestos_venta
    ADD CONSTRAINT fk_presupuesto_pedido FOREIGN KEY (pedido_id) REFERENCES public.pedidos_venta(id);


--
-- TOC entry 5237 (class 2606 OID 33763)
-- Name: presupuestos_servicio fk_presupuestos_servicio_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.presupuestos_servicio
    ADD CONSTRAINT fk_presupuestos_servicio_usuario FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id);


--
-- TOC entry 5255 (class 2606 OID 33715)
-- Name: presupuestos_venta fk_presupuestos_venta_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.presupuestos_venta
    ADD CONSTRAINT fk_presupuestos_venta_usuario FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id);


--
-- TOC entry 5294 (class 2606 OID 33745)
-- Name: recaudaciones fk_recaudaciones_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recaudaciones
    ADD CONSTRAINT fk_recaudaciones_usuario FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id);


--
-- TOC entry 5232 (class 2606 OID 33751)
-- Name: recepcion_equipos fk_recepcion_equipos_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recepcion_equipos
    ADD CONSTRAINT fk_recepcion_equipos_usuario FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id);


--
-- TOC entry 5252 (class 2606 OID 33787)
-- Name: reclamos_servicio fk_reclamos_servicio_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reclamos_servicio
    ADD CONSTRAINT fk_reclamos_servicio_usuario FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id);


--
-- TOC entry 5248 (class 2606 OID 33793)
-- Name: retiros_equipos fk_retiros_equipos_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.retiros_equipos
    ADD CONSTRAINT fk_retiros_equipos_usuario FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id);


--
-- TOC entry 5243 (class 2606 OID 33775)
-- Name: servicios_realizados fk_servicios_realizados_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servicios_realizados
    ADD CONSTRAINT fk_servicios_realizados_usuario FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id);


--
-- TOC entry 5214 (class 2606 OID 33817)
-- Name: stock_movimientos fk_stock_movimientos_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock_movimientos
    ADD CONSTRAINT fk_stock_movimientos_usuario FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id);


--
-- TOC entry 5261 (class 2606 OID 32120)
-- Name: ventas fk_venta_pedido; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ventas
    ADD CONSTRAINT fk_venta_pedido FOREIGN KEY (pedido_id) REFERENCES public.pedidos_venta(id);


--
-- TOC entry 5262 (class 2606 OID 32115)
-- Name: ventas fk_venta_presupuesto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ventas
    ADD CONSTRAINT fk_venta_presupuesto FOREIGN KEY (presupuesto_id) REFERENCES public.presupuestos_venta(id);


--
-- TOC entry 5263 (class 2606 OID 33727)
-- Name: ventas fk_ventas_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ventas
    ADD CONSTRAINT fk_ventas_usuario FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id);


--
-- TOC entry 5303 (class 2606 OID 33664)
-- Name: ordenes_compra fkpbn10tmgisv11nsee1u9swk1m; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ordenes_compra
    ADD CONSTRAINT fkpbn10tmgisv11nsee1u9swk1m FOREIGN KEY (pedido_id) REFERENCES public.pedidos_compra(id);


--
-- TOC entry 5306 (class 2606 OID 33684)
-- Name: pedidos_compra_detalles fkxnijgkvygci8eptmuli2wwbc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos_compra_detalles
    ADD CONSTRAINT fkxnijgkvygci8eptmuli2wwbc FOREIGN KEY (pedido_id) REFERENCES public.pedidos_compra(id);


--
-- TOC entry 5251 (class 2606 OID 31640)
-- Name: garantias_servicio garantias_servicio_servicio_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.garantias_servicio
    ADD CONSTRAINT garantias_servicio_servicio_id_fkey FOREIGN KEY (servicio_id) REFERENCES public.servicios_realizados(id);


--
-- TOC entry 5299 (class 2606 OID 32071)
-- Name: historial_accesos historial_accesos_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historial_accesos
    ADD CONSTRAINT historial_accesos_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id);


--
-- TOC entry 5229 (class 2606 OID 31472)
-- Name: libro_iva_compras libro_iva_compras_compra_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libro_iva_compras
    ADD CONSTRAINT libro_iva_compras_compra_id_fkey FOREIGN KEY (compra_id) REFERENCES public.compras(id);


--
-- TOC entry 5300 (class 2606 OID 32094)
-- Name: libro_iva_ventas libro_iva_ventas_venta_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libro_iva_ventas
    ADD CONSTRAINT libro_iva_ventas_venta_id_fkey FOREIGN KEY (venta_id) REFERENCES public.ventas(id);


--
-- TOC entry 5290 (class 2606 OID 31995)
-- Name: movimientos_caja movimientos_caja_banco_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movimientos_caja
    ADD CONSTRAINT movimientos_caja_banco_id_fkey FOREIGN KEY (banco_id) REFERENCES public.bancos(id);


--
-- TOC entry 5291 (class 2606 OID 31990)
-- Name: movimientos_caja movimientos_caja_forma_pago_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movimientos_caja
    ADD CONSTRAINT movimientos_caja_forma_pago_id_fkey FOREIGN KEY (forma_pago_id) REFERENCES public.formas_pago(id);


--
-- TOC entry 5292 (class 2606 OID 31985)
-- Name: movimientos_caja movimientos_caja_sesion_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movimientos_caja
    ADD CONSTRAINT movimientos_caja_sesion_id_fkey FOREIGN KEY (sesion_id) REFERENCES public.sesiones_caja(id);


--
-- TOC entry 5231 (class 2606 OID 31500)
-- Name: notas_credito_debito_compra notas_credito_debito_compra_compra_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notas_credito_debito_compra
    ADD CONSTRAINT notas_credito_debito_compra_compra_id_fkey FOREIGN KEY (compra_id) REFERENCES public.compras(id);


--
-- TOC entry 5277 (class 2606 OID 31867)
-- Name: notas_credito_debito_venta notas_credito_debito_venta_venta_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notas_credito_debito_venta
    ADD CONSTRAINT notas_credito_debito_venta_venta_id_fkey FOREIGN KEY (venta_id) REFERENCES public.ventas(id);


--
-- TOC entry 5266 (class 2606 OID 31775)
-- Name: notas_remision notas_remision_chofer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notas_remision
    ADD CONSTRAINT notas_remision_chofer_id_fkey FOREIGN KEY (chofer_id) REFERENCES public.personal(id);


--
-- TOC entry 5230 (class 2606 OID 31486)
-- Name: notas_remision_compra notas_remision_compra_compra_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notas_remision_compra
    ADD CONSTRAINT notas_remision_compra_compra_id_fkey FOREIGN KEY (compra_id) REFERENCES public.compras(id);


--
-- TOC entry 5270 (class 2606 OID 31797)
-- Name: notas_remision_detalles notas_remision_detalles_nota_remision_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notas_remision_detalles
    ADD CONSTRAINT notas_remision_detalles_nota_remision_id_fkey FOREIGN KEY (nota_remision_id) REFERENCES public.notas_remision(id);


--
-- TOC entry 5271 (class 2606 OID 31802)
-- Name: notas_remision_detalles notas_remision_detalles_producto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notas_remision_detalles
    ADD CONSTRAINT notas_remision_detalles_producto_id_fkey FOREIGN KEY (producto_id) REFERENCES public.productos(id);


--
-- TOC entry 5267 (class 2606 OID 31770)
-- Name: notas_remision notas_remision_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notas_remision
    ADD CONSTRAINT notas_remision_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id);


--
-- TOC entry 5268 (class 2606 OID 31785)
-- Name: notas_remision notas_remision_vehiculo_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notas_remision
    ADD CONSTRAINT notas_remision_vehiculo_id_fkey FOREIGN KEY (vehiculo_id) REFERENCES public.vehiculos(id);


--
-- TOC entry 5269 (class 2606 OID 31765)
-- Name: notas_remision notas_remision_venta_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notas_remision
    ADD CONSTRAINT notas_remision_venta_id_fkey FOREIGN KEY (venta_id) REFERENCES public.ventas(id);


--
-- TOC entry 5242 (class 2606 OID 31576)
-- Name: ordenes_servicio ordenes_servicio_presupuesto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ordenes_servicio
    ADD CONSTRAINT ordenes_servicio_presupuesto_id_fkey FOREIGN KEY (presupuesto_id) REFERENCES public.presupuestos_servicio(id);


--
-- TOC entry 5259 (class 2606 OID 31712)
-- Name: pedidos_venta_detalles pedidos_venta_detalles_pedido_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos_venta_detalles
    ADD CONSTRAINT pedidos_venta_detalles_pedido_id_fkey FOREIGN KEY (pedido_id) REFERENCES public.pedidos_venta(id);


--
-- TOC entry 5260 (class 2606 OID 31717)
-- Name: pedidos_venta_detalles pedidos_venta_detalles_producto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos_venta_detalles
    ADD CONSTRAINT pedidos_venta_detalles_producto_id_fkey FOREIGN KEY (producto_id) REFERENCES public.productos(id);


--
-- TOC entry 5206 (class 2606 OID 31150)
-- Name: personal personal_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal
    ADD CONSTRAINT personal_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id);


--
-- TOC entry 5239 (class 2606 OID 31559)
-- Name: presupuestos_servicio_detalles presupuestos_servicio_detalles_presupuesto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.presupuestos_servicio_detalles
    ADD CONSTRAINT presupuestos_servicio_detalles_presupuesto_id_fkey FOREIGN KEY (presupuesto_id) REFERENCES public.presupuestos_servicio(id);


--
-- TOC entry 5240 (class 2606 OID 31564)
-- Name: presupuestos_servicio_detalles presupuestos_servicio_detalles_producto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.presupuestos_servicio_detalles
    ADD CONSTRAINT presupuestos_servicio_detalles_producto_id_fkey FOREIGN KEY (producto_id) REFERENCES public.productos(id);


--
-- TOC entry 5238 (class 2606 OID 31545)
-- Name: presupuestos_servicio presupuestos_servicio_recepcion_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.presupuestos_servicio
    ADD CONSTRAINT presupuestos_servicio_recepcion_id_fkey FOREIGN KEY (recepcion_id) REFERENCES public.recepcion_equipos(id);


--
-- TOC entry 5256 (class 2606 OID 31683)
-- Name: presupuestos_venta_detalles presupuestos_venta_detalles_presupuesto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.presupuestos_venta_detalles
    ADD CONSTRAINT presupuestos_venta_detalles_presupuesto_id_fkey FOREIGN KEY (presupuesto_id) REFERENCES public.presupuestos_venta(id);


--
-- TOC entry 5257 (class 2606 OID 31688)
-- Name: presupuestos_venta_detalles presupuestos_venta_detalles_producto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.presupuestos_venta_detalles
    ADD CONSTRAINT presupuestos_venta_detalles_producto_id_fkey FOREIGN KEY (producto_id) REFERENCES public.productos(id);


--
-- TOC entry 5209 (class 2606 OID 31209)
-- Name: productos productos_unidad_medida_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_unidad_medida_id_fkey FOREIGN KEY (unidad_medida_id) REFERENCES public.unidades_medida(id);


--
-- TOC entry 5295 (class 2606 OID 32028)
-- Name: recaudaciones recaudaciones_banco_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recaudaciones
    ADD CONSTRAINT recaudaciones_banco_id_fkey FOREIGN KEY (banco_id) REFERENCES public.bancos(id);


--
-- TOC entry 5296 (class 2606 OID 32033)
-- Name: recaudaciones recaudaciones_forma_pago_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recaudaciones
    ADD CONSTRAINT recaudaciones_forma_pago_id_fkey FOREIGN KEY (forma_pago_id) REFERENCES public.formas_pago(id);


--
-- TOC entry 5297 (class 2606 OID 32023)
-- Name: recaudaciones recaudaciones_sesion_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recaudaciones
    ADD CONSTRAINT recaudaciones_sesion_id_fkey FOREIGN KEY (sesion_id) REFERENCES public.sesiones_caja(id);


--
-- TOC entry 5253 (class 2606 OID 31659)
-- Name: reclamos_servicio reclamos_servicio_referencia_servicio_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reclamos_servicio
    ADD CONSTRAINT reclamos_servicio_referencia_servicio_id_fkey FOREIGN KEY (referencia_servicio_id) REFERENCES public.servicios_realizados(id);


--
-- TOC entry 5249 (class 2606 OID 31626)
-- Name: retiros_equipos retiros_equipos_recepcion_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.retiros_equipos
    ADD CONSTRAINT retiros_equipos_recepcion_id_fkey FOREIGN KEY (recepcion_id) REFERENCES public.recepcion_equipos(id);


--
-- TOC entry 5204 (class 2606 OID 31136)
-- Name: roles_permisos roles_permisos_permiso_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles_permisos
    ADD CONSTRAINT roles_permisos_permiso_id_fkey FOREIGN KEY (permiso_id) REFERENCES public.permisos(id);


--
-- TOC entry 5205 (class 2606 OID 31131)
-- Name: roles_permisos roles_permisos_rol_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles_permisos
    ADD CONSTRAINT roles_permisos_rol_id_fkey FOREIGN KEY (rol_id) REFERENCES public.roles(id);


--
-- TOC entry 5246 (class 2606 OID 31612)
-- Name: servicios_insumos_utilizados servicios_insumos_utilizados_producto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servicios_insumos_utilizados
    ADD CONSTRAINT servicios_insumos_utilizados_producto_id_fkey FOREIGN KEY (producto_id) REFERENCES public.productos(id);


--
-- TOC entry 5247 (class 2606 OID 31607)
-- Name: servicios_insumos_utilizados servicios_insumos_utilizados_servicio_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servicios_insumos_utilizados
    ADD CONSTRAINT servicios_insumos_utilizados_servicio_id_fkey FOREIGN KEY (servicio_id) REFERENCES public.servicios_realizados(id);


--
-- TOC entry 5244 (class 2606 OID 31590)
-- Name: servicios_realizados servicios_realizados_orden_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servicios_realizados
    ADD CONSTRAINT servicios_realizados_orden_id_fkey FOREIGN KEY (orden_id) REFERENCES public.ordenes_servicio(id);


--
-- TOC entry 5245 (class 2606 OID 31595)
-- Name: servicios_realizados servicios_realizados_tecnico_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servicios_realizados
    ADD CONSTRAINT servicios_realizados_tecnico_id_fkey FOREIGN KEY (tecnico_id) REFERENCES public.usuarios(id);


--
-- TOC entry 5286 (class 2606 OID 31949)
-- Name: sesiones_caja sesiones_caja_caja_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sesiones_caja
    ADD CONSTRAINT sesiones_caja_caja_id_fkey FOREIGN KEY (caja_id) REFERENCES public.cajas(id);


--
-- TOC entry 5287 (class 2606 OID 31944)
-- Name: sesiones_caja sesiones_caja_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sesiones_caja
    ADD CONSTRAINT sesiones_caja_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id);


--
-- TOC entry 5212 (class 2606 OID 31273)
-- Name: stock_actual stock_actual_deposito_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock_actual
    ADD CONSTRAINT stock_actual_deposito_id_fkey FOREIGN KEY (deposito_id) REFERENCES public.depositos(id);


--
-- TOC entry 5213 (class 2606 OID 31268)
-- Name: stock_actual stock_actual_producto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock_actual
    ADD CONSTRAINT stock_actual_producto_id_fkey FOREIGN KEY (producto_id) REFERENCES public.productos(id);


--
-- TOC entry 5215 (class 2606 OID 31292)
-- Name: stock_movimientos stock_movimientos_deposito_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock_movimientos
    ADD CONSTRAINT stock_movimientos_deposito_id_fkey FOREIGN KEY (deposito_id) REFERENCES public.depositos(id);


--
-- TOC entry 5216 (class 2606 OID 31287)
-- Name: stock_movimientos stock_movimientos_producto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock_movimientos
    ADD CONSTRAINT stock_movimientos_producto_id_fkey FOREIGN KEY (producto_id) REFERENCES public.productos(id);


--
-- TOC entry 5207 (class 2606 OID 31164)
-- Name: sucursales sucursales_empresa_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sucursales
    ADD CONSTRAINT sucursales_empresa_id_fkey FOREIGN KEY (empresa_id) REFERENCES public.empresa(id);


--
-- TOC entry 5210 (class 2606 OID 31242)
-- Name: tarjetas_bancarias tarjetas_bancarias_banco_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tarjetas_bancarias
    ADD CONSTRAINT tarjetas_bancarias_banco_id_fkey FOREIGN KEY (banco_id) REFERENCES public.bancos(id);


--
-- TOC entry 5217 (class 2606 OID 31316)
-- Name: transferencias_stock transferencias_stock_deposito_destino_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transferencias_stock
    ADD CONSTRAINT transferencias_stock_deposito_destino_id_fkey FOREIGN KEY (deposito_destino_id) REFERENCES public.depositos(id);


--
-- TOC entry 5218 (class 2606 OID 31311)
-- Name: transferencias_stock transferencias_stock_deposito_origen_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transferencias_stock
    ADD CONSTRAINT transferencias_stock_deposito_origen_id_fkey FOREIGN KEY (deposito_origen_id) REFERENCES public.depositos(id);


--
-- TOC entry 5219 (class 2606 OID 31306)
-- Name: transferencias_stock transferencias_stock_producto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transferencias_stock
    ADD CONSTRAINT transferencias_stock_producto_id_fkey FOREIGN KEY (producto_id) REFERENCES public.productos(id);


--
-- TOC entry 5220 (class 2606 OID 31321)
-- Name: transferencias_stock transferencias_stock_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transferencias_stock
    ADD CONSTRAINT transferencias_stock_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id);


--
-- TOC entry 5202 (class 2606 OID 31121)
-- Name: usuarios_permisos usuarios_permisos_permiso_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios_permisos
    ADD CONSTRAINT usuarios_permisos_permiso_id_fkey FOREIGN KEY (permiso_id) REFERENCES public.permisos(id);


--
-- TOC entry 5203 (class 2606 OID 31116)
-- Name: usuarios_permisos usuarios_permisos_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios_permisos
    ADD CONSTRAINT usuarios_permisos_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id);


--
-- TOC entry 5200 (class 2606 OID 31106)
-- Name: usuarios_roles usuarios_roles_rol_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios_roles
    ADD CONSTRAINT usuarios_roles_rol_id_fkey FOREIGN KEY (rol_id) REFERENCES public.roles(id);


--
-- TOC entry 5201 (class 2606 OID 31101)
-- Name: usuarios_roles usuarios_roles_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios_roles
    ADD CONSTRAINT usuarios_roles_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id);


--
-- TOC entry 5208 (class 2606 OID 31176)
-- Name: vehiculos vehiculos_sucursal_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehiculos
    ADD CONSTRAINT vehiculos_sucursal_id_fkey FOREIGN KEY (sucursal_id) REFERENCES public.sucursales(id);


-- Completed on 2025-07-19 14:10:56

--
-- PostgreSQL database dump complete
--

